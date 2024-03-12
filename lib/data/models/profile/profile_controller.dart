// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fake_store_joao/data/models/profile/profile.dart';
import 'package:fake_store_joao/data/models/profile/user/user.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

class ProfileController {
  Profile _profile;
  final GlobalKey<FormState> _formKey;

  ProfileController(this._profile, this._formKey);

  setProfile(Profile newProf) {
    _profile = newProf;
    GetIt.I.get<Profile>().setNewProfile(newProf);
  }

  bool validate() => _formKey.currentState!.validate(); //add more validattion here

  User get user => _profile.user;
  GlobalKey<FormState> get formKey => _formKey;
}
