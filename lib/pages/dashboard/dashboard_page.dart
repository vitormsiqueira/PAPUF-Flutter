import 'package:flutter/material.dart';
import 'package:papuf/color_hex.dart';
import 'package:papuf/widgets/text_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

String currentSala = '1';
Widget cardsDashboard(context, altura, label, info) {
  return Card(
    elevation: 5,
    child: Container(
      padding: EdgeInsets.all(20),
      height: altura,
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            info,
            style: TextStyle(
                fontSize: 30,
                // fontWeight: FontWeight.bold,
                color: Colors.black87),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    color: Colors.white,
  );
}

_body(BuildContext context) {
  return StreamBuilder<DocumentSnapshot>(
    stream: Firestore.instance
        .collection('bd-2')
        .document('sala-${currentSala}')
        .snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return LinearProgressIndicator();
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
                        "STATUS EM TEMPO REAL SALA ${currentSala}",
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
                        cardsDashboard(
                            context,
                            150.0,
                            (snapshot.data['ar-l']['state'] == 'off')
                                ? 'Desligado desde'
                                : 'Ligado desde',
                            snapshot.data['ar-l']['time-activity']),
                      ],
                    ),
                  ),

                  // Container de cards a direita
                  Container(
                    padding: EdgeInsets.only(right: 4),
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      children: <Widget>[
                        cardsDashboard(
                            context,
                            150.0,
                            (snapshot.data['ar-r']['state'] == 'off')
                                ? 'Desligado desde'
                                : 'Ligado desde',
                            snapshot.data['ar-r']['time-activity']),
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
