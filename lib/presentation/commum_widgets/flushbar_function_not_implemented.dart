import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

//this is a snackbar to show to user that the function is not implemented yet
void flushbarNotImplementedYet(context) {
  Flushbar(
    title: 'Botão não desenvolvido',
    backgroundColor: Colors.green,
    flushbarPosition: FlushbarPosition.BOTTOM,
    message:
        'Essa funcionalidade não estpa pronta ainda :( \nAguarde as próximas versões ',
    duration: const Duration(seconds: 3),
  ).show(context);
}
