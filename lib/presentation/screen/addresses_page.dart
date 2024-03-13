import 'package:another_flushbar/flushbar.dart';
import 'package:fake_store_joao/core/default/appbar_default.dart';
import 'package:fake_store_joao/core/default/button_default.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/data/models/address.dart';
import 'package:fake_store_joao/data/models/profile/profile.dart';
import 'package:fake_store_joao/data/repositories/adresses_repository.dart';
import 'package:fake_store_joao/logic/bloc/delete_address/delete_address_bloc.dart';
import 'package:fake_store_joao/logic/bloc/get_list_address/get_list_addres_bloc.dart';
import 'package:fake_store_joao/logic/cubit/address_select/address_select_cubit.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
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
    int userId = GetIt.I.get<Profile>().user.id;
    getListAddressBloc = GetListAddressBloc(AddressesRepository(userId));
    getListAddressBloc.add(GetListAddressStarted());

    addressSelectCubit = AddressSelectCubit();
    deleteAddressBloc = DeleteAddressBloc(AddressesRepository(userId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarDefault(context, "Selecione seu endereço"),
      body: Stack(
        children: [
          BlocListener<DeleteAddressBloc, DeleteAddressState>(
            bloc: deleteAddressBloc,
            listener: (context, stateDelete) {
              if (stateDelete is DeleteAddressSuccess) {
                Flushbar(
                  title: 'Endereço removido com sucesso',
                  backgroundColor: Colors.green,
                  flushbarPosition: FlushbarPosition.BOTTOM,
                  message: 'Aprecia as funcionalidades do app',
                  duration: const Duration(milliseconds: 1500),
                ).show(context);
                getListAddressBloc.add(GetListAddressStarted());
              }
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  15.sizeH,
                  BlocBuilder<AddressSelectCubit, Address?>(
                    bloc: addressSelectCubit,
                    builder: (context, stateSelected) {
                      return BlocBuilder<GetListAddressBloc, GetListAddressState>(
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
                                          getListAddressBloc: getListAddressBloc,
                                          addressSelectCubit: addressSelectCubit,
                                          deleteAddressBloc: deleteAddressBloc,
                                          isSelected: state.listAddresses[index].id == stateSelected?.id);
                                    })
                              ],
                            );
                          }
                          return const CircularProgressIndicator();
                        },
                      );
                    },
                  ),
                  80.sizeH,
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      await context.pushNamed("address_edit");
                      getListAddressBloc.add(GetListAddressStarted());
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: ButtonBorderPrimary(text: "Adicionar endereço"),
                    ),
                  ),
                ),
              ],
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
    required this.getListAddressBloc,
    required this.addressSelectCubit,
    required this.deleteAddressBloc,
    required this.isSelected,
  });

  final Address address;
  final GetListAddressBloc getListAddressBloc;
  final AddressSelectCubit addressSelectCubit;
  final DeleteAddressBloc deleteAddressBloc;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue,
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(color: isSelected ? Colors.black : Colors.transparent, width: 2),
      ),
      child: ListTile(
        // isThreeLine: true,
        leading: const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: Center(
              child: Icon(
                Icons.house,
                color: Colors.lightBlue,
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
  }
}
