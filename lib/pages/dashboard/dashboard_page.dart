import 'package:papuf/pages/dashboard/dash_func.dart';
import 'package:flutter/material.dart';
import 'package:papuf/color_hex.dart';
import 'package:papuf/widgets/text_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:papuf/pages/current_class.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light, // status bar brightness
        title: textAppBar("Dashboard"),
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: _body(context),
    );
  }
}

//  funções do MAP
//  https://api.dart.dev/stable/2.8.4/dart-core/Map-class.html

_body(BuildContext context) {
  String currentSala = currentClassRoom.toString();
  return StreamBuilder<DocumentSnapshot>(
    stream: Firestore.instance
        .collection('bd-2')
        .document('sala-$currentSala')
        .snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return LinearProgressIndicator();
      String consumoMesArL = calculoDeConsumoMes(snapshot, "ar-l").toString();
      String consumoMesArR = calculoDeConsumoMes(snapshot, "ar-r").toString();
      /*
      return Column(
        children: <Widget>[
          Text(snapshot.data['ar-l']['state'].toString()),
          Text(snapshot.data['ar-l']['temperature'].toString()),
        ],
      );
      */

      return SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        "STATUS EM TEMPO REAL SALA $currentSala",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 4),
                    width: MediaQuery.of(context).size.width / 2,

                    // Container de cards da esquerda
                    child: Column(
                      children: <Widget>[
                        Container(
                            //width: 100.00,
                            height: 90.0,
                            child: Image(
                                color: Colors.blueAccent,
                                image: AssetImage(
                                    "assets/images/icon_ar_branco.png"))),
                        cardsDashboard(
                            context,
                            150.0,
                            (snapshot.data['ar-l']['state'] == 'off')
                                ? 'Desligado desde'
                                : 'Ligado desde',
                            snapshot.data['ar-l']['time-activity']),
                        cardsDashboard(context, 400.0, 'consumo neste mês',
                            '$consumoMesArL kWh')
                      ],
                    ),
                  ),

                  // Container de cards a direita
                  Container(
                    padding: EdgeInsets.only(right: 4),
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      children: <Widget>[
                        Container(
                            //width: 100.00,
                            height: 90.0,
                            child: Image(
                                color: Colors.blueAccent,
                                image: AssetImage(
                                    "assets/images/icon_ar_branco.png"))),
                        cardsDashboard(
                            context,
                            150.0,
                            (snapshot.data['ar-r']['state'] == 'off')
                                ? 'Desligado desde'
                                : 'Ligado desde',
                            snapshot.data['ar-r']['time-activity']),
                        cardsDashboard(context, 400.0, 'consumo neste mês',
                            '$consumoMesArR kWh')
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
