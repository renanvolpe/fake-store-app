import 'package:fake_store_joao/data/http/http_connection.dart';
import 'package:fake_store_joao/data/models/profile/profile.dart';
import 'package:fake_store_joao/data/models/user_create.dart';
import 'package:fake_store_joao/data/repositories/adresses_repository.dart';
import 'package:fake_store_joao/data/repositories/authentication_repository.dart';
import 'package:fake_store_joao/data/repositories/categories_repository.dart';
import 'package:fake_store_joao/data/repositories/products_repository.dart';
import 'package:fake_store_joao/data/repositories/users_repository.dart';
import 'package:fake_store_joao/logic/bloc/delete_address/delete_address_bloc.dart';
import 'package:fake_store_joao/logic/bloc/edit_category/edit_category_bloc.dart';
import 'package:fake_store_joao/logic/bloc/get_all_categories/get_all_categories_bloc.dart';
import 'package:fake_store_joao/logic/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:fake_store_joao/logic/bloc/get_list_address/get_list_addres_bloc.dart';
import 'package:fake_store_joao/logic/bloc/get_user/get_user_bloc.dart';
import 'package:fake_store_joao/logic/bloc/login/login_bloc.dart';
import 'package:fake_store_joao/logic/bloc/post_address/post_address_bloc.dart';
import 'package:fake_store_joao/logic/bloc/put_address/put_address_bloc.dart';
import 'package:fake_store_joao/logic/bloc/put_user/put_user_bloc.dart';
import 'package:fake_store_joao/logic/cubit/address_select/address_select_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final binds = GetIt.I;

class SetupBinds {
  static void setupBindsAuth() {
    //BINDS BEFORE HOME

      binds.registerSingleton(HttpClientsTest(Client()));
      binds.registerSingleton<AuthenticationRepository>(AuthenticationRepository(binds.get<HttpClientsTest>()));
      binds.registerSingleton<GetUserBloc>(GetUserBloc(binds.get<AuthenticationRepository>()));
      binds.registerSingleton<LoginBloc>(LoginBloc(binds.get<AuthenticationRepository>()));

      binds.registerSingleton<UserRepository>(UserRepository());
      binds.registerSingleton<PutUserBloc>(PutUserBloc(binds.get<UserRepository>()));
      //PutUserBloc 
  }

  static void setupBindsHome(Profile profile) {
    //BINDS AFTER HOME

    //Profile
    if (GetIt.I.isRegistered<Profile>()) {
      GetIt.I.get<Profile>().setNewProfile(profile); // updateBind
    } else {
      GetIt.instance.registerSingleton<Profile>(profile);
    }

    //categories
    binds.registerSingleton<CateogriesRepository>(CateogriesRepository());
    binds.registerSingleton<EditCategoryBloc>(EditCategoryBloc(binds.get<CateogriesRepository>()));
    binds.registerSingleton<GetAllCategoriesBloc>(GetAllCategoriesBloc(binds.get<CateogriesRepository>()));
    // binds.registerSingleton<DeleteCategoryBloc>(DeleteCategoryBloc(binds.get<CateogriesRepository>()));
    // binds.registerSingleton<PostCategoruBloc>(PostCategoruBloc(binds.get<CateogriesRepository>()));
   
    //products
    binds.registerSingleton<ProductRepository>(ProductRepository());
    binds.registerSingleton<GetAllProductsBloc>(GetAllProductsBloc(binds.get<ProductRepository>()));

    //Address
    binds.registerSingleton<AddressSelectCubit>(AddressSelectCubit());
    binds.registerSingleton<AddressesRepository>(AddressesRepository(binds.get<Profile>().user.id));
    binds.registerSingleton<GetListAddressBloc>(GetListAddressBloc(binds.get<AddressesRepository>()));
    binds.registerSingleton<PostAddressBloc>(PostAddressBloc(binds.get<AddressesRepository>()));
    binds.registerSingleton<PutAddressBloc>(PutAddressBloc(binds.get<AddressesRepository>()));
    binds.registerSingleton<DeleteAddressBloc>(DeleteAddressBloc(binds.get<AddressesRepository>()));
    //
  }
  static Future<void> setupAuthData()async{
      UserRepository apiUser = UserRepository();
      var userCrate = UserCreate(
          name: "João Salg",
          email: "joao@joao.com",
          password: "1234",
          avatar: "https://api.lorem.space/image/face?w=640&h=480",
          role: "admin");

      await apiUser.createUser(userCrate);

  }
}
