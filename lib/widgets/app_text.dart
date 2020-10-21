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
  String mainColor;
  String secondColor;
  double myFontSize;

  AppText(
    this.label,
    {
      this.myFontSize = 18,
      this.hint, 
      this.password = false,
      this.controller,
      this.validator,
      this.keyboardType,
      this.textInputAction,
      this.focusNode,
      this.nextFocus,
      this.mainColor = "#8D9CCB",
      this.secondColor = "#ffffff",
    }
  );

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
        fontSize: myFontSize,
        color: hexToColor(secondColor),
      ),

      decoration: InputDecoration(
        //estilo do texto principal
        labelText: label,
        labelStyle: TextStyle(
          fontSize: myFontSize,
          color: hexToColor(mainColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: hexToColor(mainColor)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: hexToColor(secondColor)),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: hexToColor(secondColor),
          fontSize: myFontSize,
        ),
      ),
    );
  }
}
