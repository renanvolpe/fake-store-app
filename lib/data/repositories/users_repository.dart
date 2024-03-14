import 'package:fake_store_joao/core/constants/endpoints.dart';
import 'package:fake_store_joao/data/http/http_connection.dart';
import 'package:fake_store_joao/data/models/profile/user/user.dart';
import 'package:fake_store_joao/data/models/user_create.dart';
import 'package:result_dart/result_dart.dart';

abstract class UsersRequest {
  createUser(UserCreate userCreate);
  updateUser(User user);
}

class UserRepository implements UsersRequest {
  HttpClients connect = HttpClients();

  @override
  Future<Result<User, String>> createUser(UserCreate userCreate) async {
    Map<String, dynamic> body = {
      "name": userCreate.name,
      "email": userCreate.email,
      "password": userCreate.password,
      "avatar": userCreate.avatar,
      "role": userCreate.role
    };

    var response = await connect.httpPost(endpoint: Endpoints.users, body: body);

    return response.fold((success) {
      var user = User.fromMap(success);
      return Success(user);
    }, (failure) => Failure(failure));
  }

  @override
  Future<Result<User, String>> updateUser(User user) async {
    Map body = {
      "name": user.name.value,
      "email": user.email.value,
      "password": user.password.value,
    };

    var response = await connect.httpPut(endpoint: "${Endpoints.users}${user.id}", body: body);

    return response.fold((success) {
      var user = User.fromMap(success);
      return Success(user);
    }, (failure) => Failure(failure));
  }
}
