import 'dart:async';

import 'package:flutter/material.dart';

class GenericTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? errorMsg;
  final int? maxLines;
  void Function(String?)? onSaved;
  final GlobalKey<FormState>? formKey;
  late String? initialValue;

  Timer? timer;

  GenericTextFormField({
    Key? key,
    this.labelText,
    this.hintText,
    this.errorMsg,
    this.maxLines,
    this.onSaved,
    this.formKey,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorMsg ?? 'Required';
        } else {
          return null;
        }
      },
      onSaved: onSaved,
      onChanged: (_) {
        if (timer != null) {
          timer!.cancel();
        }
        timer = Timer(Duration(milliseconds: 500), () {
          formKey!.currentState!.validate();
        });
      },
    );
  }
}
