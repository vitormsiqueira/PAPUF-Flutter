import 'package:flutter/material.dart';
import 'package:papuf/widgets/controle.dart';
import 'package:papuf/widgets/jsonToSend.dart';
import '../color_hex.dart';

class ControlTemperature extends StatefulWidget {
  
  final int temp;
  final String topic;
  const ControlTemperature(this.temp, this.topic);

  @override
  _ControlTemperatureState createState() => _ControlTemperatureState();
}

class _ControlTemperatureState extends State<ControlTemperature> {
  String selected;
  int temp;
  String topic;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      selected = this.selected;
      temp = widget.temp;
      topic = widget.topic;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          FlatButton(
              onPressed: () {
                setState(() {
                  temp++;
                });
                //envia um json {"temp": "3", "state": "on"} com temperatura e estado
                PublishM(CreateJsonTempState(temp.toString(), "on"), topic);
              },
              child: _textOthers(selected, '+', 45, FontWeight.w400),
            ),
          
          Container(
            child: _textOthers(selected, temp.toString()+'º', 45, FontWeight.w300),
          ),
           FlatButton(
              onPressed: () {
                setState(() {
                  temp--;
                });
                PublishM(CreateJsonTempState(temp.toString(), "on"), topic);
              },
              child: _textOthers(selected, '-', 45, FontWeight.w400),
           ),
        SizedBox(
          height: 15,
        )
        ],
      ),
    );
  }
}

_textOthers(
      String selected, String texto, int size, FontWeight myFontWeight) {
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