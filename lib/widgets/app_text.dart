import 'package:flutter/material.dart';
import 'package:papuf/color_hex.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppText extends StatelessWidget {
  final bool underline;
  final String label;
  final String hint;
  final bool password;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final FocusNode nextFocus;
  final String mainColor;
  final String secondColor;
  final double myFontSize;
  final bool isBackGround;
  final IconData iconForm;

  AppText(this.label,
      {this.myFontSize = 16,
      this.hint,
      this.password = false,
      this.controller,
      this.validator,
      this.keyboardType,
      this.textInputAction,
      this.focusNode,
      this.nextFocus,
      this.mainColor = "#afbce4",
      this.secondColor = '#ffffff',
      this.underline = true,
      this.isBackGround = true,
      this.iconForm = FontAwesomeIcons.userAlt});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.only(left: 0, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isBackGround ? hexToColor("#4b6bcf") : hexToColor("#4163CD")),
      child: TextFormField(
        cursorColor: Colors.white,
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
          fillColor: Colors.white,
          //estilo do texto principal
          labelText: label,
          labelStyle: TextStyle(
            fontSize: myFontSize,
            color: hexToColor(mainColor),
          ),
          enabledBorder: InputBorder.none,
          focusColor: Colors.black,
          hoverColor: Colors.white,
          focusedBorder: InputBorder.none,
          /*enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: hexToColor(mainColor)),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10))), 
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: hexToColor(secondColor)),
          ), */
          hintText: hint,
          hintStyle: TextStyle(
            color: hexToColor(secondColor),
            fontSize: myFontSize,
          ),
          prefixIcon: IconTheme(
            data: IconThemeData(color: Colors.white38),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FaIcon(
                iconForm,
                color: Colors.white30,
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
