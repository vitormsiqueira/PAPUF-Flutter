import 'package:flutter/material.dart';
import 'package:papuf/color_hex.dart';

class AppText extends StatelessWidget {
  String label;
  String hint;
  bool password;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  FocusNode focusNode;
  FocusNode nextFocus;

  AppText(
    this.label,
    this.hint, {
    this.password = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocus,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          //se nextFocus for null o foco vai ser o _focusPassword
          return FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      //recebe o tipo do teclado qdo pressionado o field
      keyboardType: keyboardType,

      //estilo do texto qdo começa a digitação
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),

      decoration: InputDecoration(
        //estilo do texto principal
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 18,
          color: hexToColor("#8D9CCB"),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: hexToColor("#8D9CCB")),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
