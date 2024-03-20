import 'package:fake_store_joao/core/default/appbar_default.dart';
import 'package:fake_store_joao/core/default/button_default.dart';
import 'package:fake_store_joao/data/models/address.dart';
import 'package:fake_store_joao/data/models/profile/profile.dart';
import 'package:fake_store_joao/data/repositories/adresses_repository.dart';
import 'package:fake_store_joao/logic/bloc/post_address/post_address_bloc.dart';
import 'package:fake_store_joao/logic/bloc/put_address/put_address_bloc.dart';
import 'package:fake_store_joao/presentation/commum_widgets/app_flushbars.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:fake_store_joao/presentation/commum_widgets/textfield_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AddressesEditPage extends StatefulWidget {
  const AddressesEditPage({super.key, this.selectedAddress});

  final Address? selectedAddress;

  @override
  State<AddressesEditPage> createState() => _AddressesEditPageState();
}

class _AddressesEditPageState extends State<AddressesEditPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Address address;

  late PutAddressBloc putAddressBloc;
  late PostAddressBloc postAddressBloc;

  @override
  void initState() {
    super.initState();
    address = widget.selectedAddress ?? Address.empty();

    int userId = GetIt.I.get<Profile>().user.id;
    var repository = AddressesRepository(userId);

    putAddressBloc = PutAddressBloc(repository);
    postAddressBloc = PostAddressBloc(repository);
  }

  bool _isToAdd() => widget.selectedAddress == null;

  String _getTitle() => _isToAdd() ? "Add new address" : "Edit Address";

  String _getTitleButton() => _isToAdd() ? "Add address" : "Update Address";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppbarDefault(context, _getTitle()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                15.sizeH,
                TextFieldAddress(text: address.street, hintText: 'Street', onChanged: (v) => address.street = v),
                15.sizeH,
                TextFieldAddress(text: address.district, hintText: 'District', onChanged: (v) => address.district = v),
                15.sizeH,
                TextFieldAddress(text: address.city, hintText: 'City', onChanged: (v) => address.city = v),
                15.sizeH,
                TextFieldAddress(text: address.state, hintText: 'State', onChanged: (v) => address.state = v),
                15.sizeH,
                TextFieldAddress(text: address.num, hintText: 'Number', onChanged: (v) => address.num = v),
                15.sizeH,
                TextFieldAddress(
                    text: address.complement, hintText: 'Complement', onChanged: (v) => address.complement = v),
                150.sizeH,
                Row(
                  children: [
                    Expanded(
                      child: BlocConsumer<PostAddressBloc, PostAddressState>(
                        bloc: postAddressBloc,
                        listener: (context, state) async {
                          if (state is PostAddressSuccess) {
                            await flushbarSuccess(context, 'Address created', 'Test other features in this app');
                            Navigator.pop(context);
                          }
                          if (state is PostAddressFailure) {
                            await flushbarError(context, 'Error in create address', 'review your address data');
                          }
                        },
                        builder: (context, statePost) {
                          return BlocConsumer<PutAddressBloc, PutAddressState>(
                            bloc: putAddressBloc,
                            listener: (context, state) async {
                              if (state is PutAddressSuccess) {
                                await flushbarSuccess(context, 'Adresses updated', 'Test other features in this app');
                                Navigator.pop(context);
                              }
                              if (state is PostAddressFailure) {
                                await flushbarError(context, 'Error in update address', 'review your address data');
                              }
                            },
                            builder: (context, statePut) {
                              if (statePost is PostAddressProgress || statePut is PutAddressProgress) {
                                const InkWell(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: ButtonBorderPrimary(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                );
                              }
                              return InkWell(
                                onTap: () {
                                  bool isValid = _formKey.currentState!.validate();
                                  if (isValid) {
                                    if (_isToAdd()) {
                                      postAddressBloc.add(PostAddressStarted(address: address));
                                    } else {
                                      putAddressBloc.add(PutAddressStarted(address: address));
                                    }
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: ButtonBorderPrimary(text: _getTitleButton()),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                30.sizeH,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
