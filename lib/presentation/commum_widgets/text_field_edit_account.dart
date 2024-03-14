import 'package:fake_store_joao/core/default/textfield_decoration_default.dart';
import 'package:fake_store_joao/data/models/abstract_textformfield.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldRegister extends StatefulWidget {
  TextFieldRegister({
    super.key,
    this.field,
    this.text,
  });
  final IValueObject? field;
  String? text;

  @override
  State<TextFieldRegister> createState() => _TextFieldRegisterState();
}

class _TextFieldRegisterState extends State<TextFieldRegister> {
//like email, cpf and others fields in register

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.field?.value,
      validator: widget.field?.validator,
      onChanged: widget.field?.setValue,
      decoration: textfieldDecorationDefault(hintText: widget.field!.hintText),
      inputFormatters: widget.field?.getMasks(),
    );
  }
}
