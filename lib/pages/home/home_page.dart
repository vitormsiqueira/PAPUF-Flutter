import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papuf/color_hex.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            "Salas de Aula",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      child: _listViewSalas(),
    );
  }
}

_listViewSalas() {
  bool pressed = false;
  return Container(
    padding: EdgeInsets.only(left: 15),
    height: 30,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(15, (int index) {
        // gera a lista
        return Card(
          elevation: 0,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {},
            splashColor: hexToColor("#4DE4B2"),
            highlightColor: hexToColor("#4DE4B2"),
            child: Container(
              height: 36,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: hexToColor("#4DE4B2")),
              ),
              child: Center(
                child: Text(
                  "Sala $index",
                  style: pressed
                      ? TextStyle(
                          fontSize: 16,
                          letterSpacing: .6,
                          color: hexToColor("#4DE4B2"),
                          fontWeight: FontWeight.w500,
                        )
                      : TextStyle(color: hexToColor("#4DE4B2")),
                ),
              ),
            ),
          ),
        );
      }),
    ),
  );
}
