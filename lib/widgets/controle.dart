import 'package:flutter/material.dart';

import '../color_hex.dart';

bool pressed = false;

class Controle extends StatefulWidget {
  @override
  _ControleState createState() => _ControleState();
}

class _ControleState extends State<Controle> {
  String selected1 = "Off";
  String selected2 = "Off";
  int um = 1;
  int dois = 2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _modulo(selected1, um, "19º"),
        SizedBox(
          width: 40,
        ),
        _modulo(selected2, dois, "21º")
      ],
    );
  }

  _modulo(String selected, int i, String temp) {
    return Container(
      padding: EdgeInsets.all(15),
      width: 150,
      height: 350,
      decoration: _controleBoxDecoration(selected),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: selected == "On"
                ? _img("assets/images/icon_ar_branco.png")
                : _img("assets/images/icon_ar_azul.png"),
          ),
          Container(
            width: 80,
            height: 60,
            child: InkWell(
              onTap: () {
                print(selected);
              },
              child: _textOthers(selected, '+', 45, FontWeight.w400),
            ),
          ),
          Container(
            width: 80,
            height: 60,
            child: _textOthers(selected, temp, 45, FontWeight.w300),
          ),
          Container(
            width: 80,
            height: 60,
            child: InkWell(
              onTap: () {
                print(selected);
              },
              child: _textOthers(selected, '-', 55, FontWeight.w400),
            ),
          ),
          Container(
            width: 80,
            height: 60,
            child: InkWell(
              onTap: () {
                print(selected);
                // aqui o selected não estava alterando o estado global, apenas qdo especificando se seelcted1 ou selected2
                // mas ta aí uma solução porca
                setState(() {
                  if (selected1 == 'Off' && i == 1) {
                    selected1 = 'On';
                  } else if (selected1 == 'On' && i == 1) {
                    selected1 = 'Off';
                  } else if (selected2 == 'Off' && i == 2) {
                    selected2 = 'On';
                  } else if (selected2 == 'On' && i == 2) {
                    selected2 = 'Off';
                  }
                });
              },
              splashColor: Colors.black,
              child: _textOnOff(selected),
            ),
          ),
        ],
      ),
    );
  }

  _controleBoxDecoration(String selected) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: selected == "On" ? hexToColor("#4163CD") : Colors.white,
      boxShadow: [
        BoxShadow(
          color: selected == "On" ? hexToColor("#4163CD") : Colors.black38,
          blurRadius: 25.0, // has the effect of softening the shadow
          spreadRadius: .5, // has the effect of extending the shadow
        )
      ],
    );
  }

  _textOnOff(String selected) {
    return Center(
      child: Text(
        selected,
        style: TextStyle(
          fontSize: 32,
          letterSpacing: .6,
          color: selected == "On" ? Colors.white : hexToColor("#4163CD"),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  _textOthers(
      String selected, String texto, int size, FontWeight MyFontWeight) {
    return Center(
      child: Text(
        texto,
        style: TextStyle(
          fontSize: size.toDouble(),
          color: selected == "On" ? Colors.white : hexToColor("#4163CD"),
          fontWeight: MyFontWeight,
        ),
      ),
    );
  }
}

_img(String img) {
  return Container(
    height: 60,
    child: Image.asset(
      img,
      fit: BoxFit.cover,
    ),
  );
}
