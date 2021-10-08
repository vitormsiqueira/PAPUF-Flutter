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
  final Color mainColor;
  final String secondColor;
  final double myFontSize;
  final bool isBackGround;
  final IconData iconForm;
  final bool isBorderColor;
  final bool isUnderLine;

  AppText(
    this.label, {
    this.myFontSize = 15,
    this.hint,
    this.password = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocus,
    this.mainColor = Colors.white38,
    this.secondColor = '#ffffff',
    this.underline = true,
    this.isBackGround = false,
    this.iconForm = FontAwesomeIcons.userAlt,
    this.isBorderColor = false,
    this.isUnderLine = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            width: 1.5,
            color: isBorderColor ? Colors.white10 : Colors.transparent,
          ),
          color: isBackGround ? hexToColor("#4b6bcf") : Colors.transparent),
      child: TextFormField(
        cursorColor: mainColor,
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
            color: mainColor,
          ),
          enabledBorder: isUnderLine
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(10)))
              : InputBorder.none,

          focusColor: Colors.black,
          hoverColor: Colors.white,
          focusedBorder: isUnderLine
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: hexToColor(secondColor)))
              : InputBorder.none,

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
                color: mainColor,
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
