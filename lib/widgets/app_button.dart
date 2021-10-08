import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papuf/color_hex.dart';

class AppButton extends StatelessWidget {
  String name;
  Function onPressed;
  bool showProgress;
  String backGroundColor;

  AppButton(
    this.name, {
    this.onPressed,
    this.showProgress = false,
    this.backGroundColor = "#4DE4B2",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width, // ocupar toda a largura
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: hexToColor(backGroundColor),
        elevation: 0,
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
      ),
    );
  }
}
