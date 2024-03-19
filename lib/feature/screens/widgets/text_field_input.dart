import 'package:flutter/material.dart';
import '/core/constants/constants.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPassword;
  final String hintText;
  final String inputLabel;

  final TextInputType textInputType;
  const TextFieldInput({
    super.key,
    required this.textEditingController,
    this.isPassword = false,
    required this.hintText,
    required this.textInputType,
    required this.inputLabel,
  });

  @override
  Widget build(BuildContext context) {
    const inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    );
    return TextField(

maxLines: 1,
      controller: textEditingController,
      decoration: InputDecoration(

        labelText: inputLabel,
        labelStyle: const TextStyle(
          fontSize: 18,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 18,
        ),
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        fillColor: Colors.white,
        floatingLabelStyle: const TextStyle(fontSize: 18, color: Constants.grey, fontWeight: FontWeight.bold),
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPassword,
    );
  }
}
