import 'dart:async';

import 'package:flutter/material.dart';
import 'package:papuf/utils/connect_MQTT.dart';
import 'package:papuf/utils/control_temperature.dart';
import 'package:papuf/widgets/jsonToSend.dart';
import '../color_hex.dart';

bool pressed = false;

class Controle extends StatefulWidget {
  final int currentSala;
  final int temp;
  final String topic;

  const Controle(this.temp, this.topic, {this.currentSala});
  @override
  _ControleState createState() => _ControleState();
}

// class TemperatureCreator {
//   TemperatureCreator() {
//     _controller.sink.add(temp);
//     temp++;
//   }
// }

class _ControleState extends State<Controle> {
  int temp;
  String selected1 = "Off";
  String selected2 = "On";
  int um = 1;
  int dois = 2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      temp = widget.temp;
      topic = widget.topic;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _modulo(selected1, topic, um), // variavel ar1 e ar2 definida em connect_MQTT.dart
      ],
    );
  }

  _modulo(String selected, String topic, int i) {
    final _controller = StreamController<int>();

    return Container(
      padding: EdgeInsets.all(15),
      width: 150,
      height: 350,
      decoration: _controleBoxDecoration(selected),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            child: selected == "On"
                ? _img("assets/images/icon_ar_branco.png")
                : _img("assets/images/icon_ar_azul.png"),
          ),
          SizedBox(
            height: 15,
          ),
          RawMaterialButton(
            onPressed: () {
              setState(() {
                temp++;
                print(temp);
                //print('++++++++'+temp.toString());
              });
              //envia um json {"temp": temp, "state": "on"} com temperatura e estado
              publishM(
                  createJsonTempState(temp.toString(), _setStateOn(i)), topic);
            },
            child: _textOthers(selected, '+', 45, FontWeight.w400),
            shape: CircleBorder(),
          ),

          Container(
            child: _textOthers(
                selected, temp.toString() + 'º', 45, FontWeight.w300),
          ),

          RawMaterialButton(
            onPressed: () {
              setState(() {
                temp--;
              });
              publishM(
                  createJsonTempState(temp.toString(), _setStateOn(i)), topic);
            },
            child: _textOthers(selected, '-', 50, FontWeight.w400),
            shape: CircleBorder(),
          ),

          SizedBox(
            height: 10,
          ),
          //ControlTemperature(ar2, "temp-2"),
          Container(
            width: 60,
            height: 60,
            child: RawMaterialButton(
              onPressed: () {
                //RequestState(topic);
                //print('selected'+selected);
                // aqui o selected não estava alterando o estado global, apenas qdo especificando se seelcted1 ou selected2
                // mas ta aí uma solução porca
                setState(() {
                  _currentState(i);
                });
                // publishM(createJsonTempState("0" ,selected), topic);
              },
              child: _textOnOff(selected),
              shape: CircleBorder(),
            ),
          ),
        ],
      ),
    );
  }

  // essa função força a setar o estado de "On" sempre que trocar a temperatura com o estado atual "Off"
  _setStateOn(int i) {
    if (selected1 == 'Off' && i == 1) {
      selected1 = 'On';
    } else if (selected2 == 'Off' && i == 2) {
      selected2 = 'On';
    }
  }

  // essa função faz o "switch" do estado do controle
  _currentState(int i) {
    if (selected1 == 'Off' && i == 1) {
      selected1 = 'On';
    } else if (selected1 == 'On' && i == 1) {
      selected1 = 'Off';
    } else if (selected2 == 'Off' && i == 2) {
      selected2 = 'On';
    } else if (selected2 == 'On' && i == 2) {
      selected2 = 'Off';
    }
  }

  _controleBoxDecoration(String selected) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: selected == "On" ? hexToColor("#4163CD") : Colors.white,
      boxShadow: [
        BoxShadow(
          color: selected == "On" ? hexToColor("#838BDA") : Colors.grey[200],
          blurRadius: 15.0, // has the effect of softening the shadow
          spreadRadius: 0.5, // has the effect of extending the shadow
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
      String selected, String texto, int size, FontWeight myFontWeight) {
    print(texto);
    return Center(
      child: Text(
        texto,
        style: TextStyle(
          fontSize: size.toDouble(),
          color: selected == "On" ? Colors.white : hexToColor("#4163CD"),
          fontWeight: myFontWeight,
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
