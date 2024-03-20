import 'package:another_flushbar/flushbar.dart';
import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:flutter/material.dart';

//this is a snackbar to show to user that the function is not implemented yet
void flushbarNotImplementedYet(context) {
  Flushbar(
    title: 'It´s not develop yet',
    backgroundColor: Colors.green,
    flushbarPosition: FlushbarPosition.BOTTOM,
    message: 'This function is not worked yet :( \nWait for new versions',
    duration: const Duration(seconds: 3),
  ).show(context);
}

Future flushbarSuccess(context, String title, String message) async{
  Flushbar(
    title: title,
    backgroundColor: ColorsApp.kPrimary,
    flushbarPosition: FlushbarPosition.BOTTOM,
    message: message,
    duration: const Duration(seconds: 3),
  ).show(context);
}

Future flushbarError(context, String title, String message) async{
  Flushbar(
    title: title,
    backgroundColor: Colors.red,
    flushbarPosition: FlushbarPosition.BOTTOM,
    message: message,
    duration: const Duration(seconds: 3),
  ).show(context);
}
