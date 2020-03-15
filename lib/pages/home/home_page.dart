import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papuf/color_hex.dart';
import 'package:papuf/pages/dashboard/dashboard_page.dart';
import 'package:papuf/pages/notifications/notifications_page.dart';
import 'package:papuf/pages/profile/profile.dart';
import 'package:papuf/widgets/controle.dart';
import 'package:papuf/widgets/list_view_classes.dart';
import 'package:papuf/widgets/text_appbar.dart';

import 'package:flutter/material.dart';
import 'package:papuf/widgets/text_appbar.dart';

class HomePage extends StatefulWidget {
  final String login;
  const HomePage(this.login);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  // Variáveis responsável por fazer a "paginação" de informações da list Salas de Aulas
  bool pressed = false;
  int _selectedClass = 0;
  final _classOptions = [
    print("Sala 1")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light, // status bar brightness
        title: widget.login == 'admin'
            ? textAppBar("Salas de Aula")
            : textAppBar("Minhas Aulas"),
        elevation: 0,
        backgroundColor: Colors.white,
        
      ),
      body: _body(context),
    );
  }
}

_body(BuildContext context) {
  return SingleChildScrollView(
    child: Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          ListClasses(),
          _textControle(),
          Controle(
            currentSala: 1,
          ),
          _textDashboard(),
          _dashboard(context),
        ],
      ),
    ),
  );
}

_dashboard(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30.0, left: 30, right: 30),
    child: Container(
      padding: EdgeInsets.only(left: 15),
      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            child: Icon(
              Icons.trending_up,
              color: hexToColor("#4163CD"),
              size: 35,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: 15, top: 16, right: 56), //consertar isso daqui
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Consumo hoje",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "450 kW",
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            width: 55,
            height: 55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.black45,
                    size: 30,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15.0, // has the effect of softening the shadow
            spreadRadius: .5, // has the effect of extending the shadow
          )
        ],
      ),
    ),
  );
}

_textDashboard() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 30, bottom: 20),
          child: Text(
            "Dashboard",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
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
              color: Colors.black54,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )
    ],
  );
}
