import 'package:fake_store_joao/core/default/textfield_decoration_default.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldAddress extends StatefulWidget {
  TextFieldAddress({super.key, this.text, this.onChanged, required this.hintText});
  String? text;
  String hintText;
  void Function(String)? onChanged;

  @override
  State<TextFieldAddress> createState() => _TextFieldAddressState();
}

class _TextFieldAddressState extends State<TextFieldAddress> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.text,
      validator: (v) => v!.isEmpty ? "Campo obrigatório" : null,
      onChanged: widget.onChanged,
      decoration: textfieldDecorationDefault(hintText: widget.hintText),
    );
  }
}
