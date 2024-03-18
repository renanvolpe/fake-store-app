import 'package:another_flushbar/flushbar.dart';
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
