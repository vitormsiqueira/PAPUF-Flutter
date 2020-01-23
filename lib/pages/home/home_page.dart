import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papuf/color_hex.dart';
import 'package:papuf/pages/home/bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light, // status bar brightness
        title: _textAppBar(),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: _body(context),
      bottomNavigationBar: BottomNavyBar(),
    );
  }

  _body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _listViewSalas(),
          _textControle(),
          _controle(),
          _dashboard(),
          _cardDashboard(context),
        ],
      ),
    );
  }
}

_textAppBar() {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0),
    child: Text(
      "Salas de Aula",
      style: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

_cardDashboard(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15.0, left: 30, right: 30),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: hexToColor("#4163CD"),
      ),
    ),
  );
}

_dashboard() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 30, bottom: 20),
          child: Text(
            "Dashboard",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 22,
            ),
          ),
        ),
      )
    ],
  );
}

_textControle() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 30, bottom: 20),
          child: Text(
            "Controle",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 22,
            ),
          ),
        ),
      )
    ],
  );
}

_controle() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        width: 150,
        height: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: hexToColor("#4163CD"),
        ),
      ),
      SizedBox(
        width: 40,
      ),
      Container(
        width: 150,
        height: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: hexToColor("#4163CD"),
        ),
      ),
    ],
  );
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
              width: 80,
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
