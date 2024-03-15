import 'package:fake_store_joao/core/default/button_default.dart';
import 'package:fake_store_joao/core/default/circular_progress_indicator.dart';
import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/data/models/profile/profile.dart';
import 'package:fake_store_joao/logic/bloc/get_all_categories/get_all_categories_bloc.dart';
import 'package:fake_store_joao/logic/get_it/init_get_it.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class SelectCategoriesAndAddress extends StatefulWidget {
  const SelectCategoriesAndAddress({
    super.key,
  });

  @override
  State<SelectCategoriesAndAddress> createState() => _SelectCategoriesAndAddressState();
}

class _SelectCategoriesAndAddressState extends State<SelectCategoriesAndAddress> {
  var user = GetIt.I.get<Profile>();

  late GetAllCategoriesBloc getAllCategoriesBloc;

  @override
  void initState() {
    getAllCategoriesBloc = binds.get<GetAllCategoriesBloc>();
    getAllCategoriesBloc.add(GetAllCategoriesStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCategoriesBloc, GetAllCategoriesState>(
      bloc: getAllCategoriesBloc,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hi, ${user.user.name.value}", style: Style.defaultTextStyle.copyWith(fontSize: 18)),
              10.sizeH,
              Text("What are you looking for today?",
                  style: Style.defaultTextStyle.copyWith(fontSize: 32, fontWeight: FontWeight.w600)),
              15.sizeH,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonPrimary(
                    onTap: () => context.push("/home/address"),
                    radius: 30,
                    paddingV: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.pin_drop, color: ColorsApp.kBlack),
                        5.sizeW,
                        Text(
                          "Adresses",
                          style: Style.defaultTextStyle.copyWith(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              25.sizeH,
              if (state is GetAllCategoriesSuccess)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      10.sizeW,
                      for (int i = 0; i < state.category.length; i++) ...[
                        ButtonBorderPrimary(
                          onTap: () => context.pushNamed("products", queryParameters: {
                            "nameCat": state.category[i].name,
                            "idCat": state.category[i].id.toString()
                          }),
                          radius: 30,
                          paddingV: 3,
                          paddingH: 15,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                state.category[i].name,
                                style: Style.defaultLightTextStyle.copyWith(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        15.sizeW,
                      ],
                      // InkWell(
                      //   onTap: () => context.push("/home/categories/${state.category[i].id}"),
                      //   child: Ink(
                      //     child: Center(
                      //       child: Padding(
                      //         padding: const EdgeInsets.symmetric(vertical: 25),
                      //         child: ButtonBorderPrimary(
                      //           child: Row(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //               const Icon(Icons.shopping_cart, color: Colors.lightBlue),
                      //               5.sizeW,
                      //               Text(
                      //                 state.category[i].name,
                      //                 style: Style.defaultTextStyle.copyWith(fontSize: 24),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              if (state is GetAllCategoriesProgress) const CircularProgressIndicatorDefault()
            ],
          ),
        );
      },
    );
  }
}
