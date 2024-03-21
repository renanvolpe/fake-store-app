import 'package:fake_store_joao/core/default/appbar_default.dart';
import 'package:fake_store_joao/core/default/button_default.dart';
import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/data/models/address.dart';
import 'package:fake_store_joao/logic/bloc/delete_address/delete_address_bloc.dart';
import 'package:fake_store_joao/logic/bloc/get_list_address/get_list_addres_bloc.dart';
import 'package:fake_store_joao/logic/cubit/address_select/address_select_cubit.dart';
import 'package:fake_store_joao/logic/get_it/init_get_it.dart';
import 'package:fake_store_joao/presentation/commum_widgets/app_flushbars.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddressesPage extends StatefulWidget {
  const AddressesPage({super.key});

  @override
  State<AddressesPage> createState() => _AddressesPageState();
}

class _AddressesPageState extends State<AddressesPage> {
  late GetListAddressBloc getListAddressBloc;
  late DeleteAddressBloc deleteAddressBloc;
  late AddressSelectCubit addressSelectCubit;

  @override
  void initState() {
    super.initState();

    getListAddressBloc = binds.get<GetListAddressBloc>();
    getListAddressBloc.add(GetListAddressStarted());

    addressSelectCubit = binds.get<AddressSelectCubit>();

    deleteAddressBloc = binds.get<DeleteAddressBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarDefault(context, "Adresses"),
      body: Stack(
        children: [
          BlocListener<DeleteAddressBloc, DeleteAddressState>(
            bloc: deleteAddressBloc,
            listener: (context, stateDelete) {
              if (stateDelete is DeleteAddressSuccess) {
                  flushbarSuccess(
                                context, 'Adresses removed', 'Test other features in this app');
               
                getListAddressBloc.add(GetListAddressStarted());
              }
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<GetListAddressBloc, GetListAddressState>(
                    bloc: getListAddressBloc,
                    builder: (context, state) {
                      if (state is GetListAddressSuccess) {
                        return Column(
                          children: [
                            15.sizeH,
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.listAddresses.length,
                                itemBuilder: (context, index) {
                                  return AddressCard(
                                    address: state.listAddresses[index],
                                  );
                                })
                          ],
                        );
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                  80.sizeH,
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonBorderPrimary(
                      onTap: () async {
                        await context.pushNamed("address_edit");
                        getListAddressBloc.add(GetListAddressStarted());
                      },
                      text: "Add address"),
                  15.sizeH
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.address,
  });

  final Address address;

  @override
  Widget build(BuildContext context) {
    AddressSelectCubit addressSelectCubit = binds.get<AddressSelectCubit>();

    DeleteAddressBloc deleteAddressBloc = binds.get<DeleteAddressBloc>();
    GetListAddressBloc getListAddressBloc = binds.get<GetListAddressBloc>();
    return BlocBuilder<AddressSelectCubit, Address?>(
      bloc: addressSelectCubit,
      builder: (context, stateSelect) {
        bool isSelected = address.id == stateSelect?.id;
        return Card(
          color: ColorsApp.kPrimary,
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: isSelected ? ColorsApp.kDarkGrey : Colors.transparent, width: 2),
          ),
          child: ListTile(
            // isThreeLine: true,
            leading: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Center(
                  child: Icon(
                    Icons.house,
                    color: ColorsApp.kPrimary,
                  ),
                )),
            title: Text(
              address.street,
              style: Style.defaultLightTextStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${address.city} - ${address.state}',
                  style: Style.defaultLightTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                Text(
                  '${address.num} - ${address.complement}',
                  style: Style.defaultLightTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 17),
                ),
              ],
            ),

            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                    onTap: () async {
                      await context.pushNamed("address_edit", extra: address);
                      getListAddressBloc.add(GetListAddressStarted());
                    },
                    child: const CircleAvatar(
                        backgroundColor: Colors.white, radius: 20, child: Icon(Icons.edit, color: Colors.lightBlue))),
                10.sizeW,
                InkWell(
                    onTap: () => deleteAddressBloc.add(DeleteAddressStarted(id: address.id)),
                    child: const CircleAvatar(
                        backgroundColor: Colors.white, radius: 20, child: Icon(Icons.delete, color: Colors.red))),
              ],
            ),
            onTap: () async => addressSelectCubit.select(address),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        );
      },
    );
  }
}
