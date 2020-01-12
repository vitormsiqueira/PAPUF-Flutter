import 'package:flutter/material.dart';
import 'package:papuf/color_hex.dart';

class AppButtonOutline extends StatelessWidget {
  String name;
  Function onPressed;
  bool showProgress;
  String backGroundColor;

  AppButtonOutline(this.name,
      {this.onPressed,
      this.showProgress = false,
      this.backGroundColor = "#4DE4B2"});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: OutlineButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: hexToColor(backGroundColor),
        child: showProgress //if que mostra a o progresso circular
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              )
            : Text(
                name,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
        onPressed: onPressed,
        borderSide: BorderSide(color: Colors.white),
      ),
    );
  }
}
