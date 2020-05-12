import 'package:flutter/material.dart';
import 'package:papuf/color_hex.dart';
import 'package:papuf/widgets/text_appbar.dart';

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

_body(BuildContext context) {
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
                    "STATUS EM TEMPO REAL",
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
                width: MediaQuery.of(context).size.width/2,

                // Container de cards da esquerda
                child: Column(
                  children: <Widget>[
                    Card(
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 109.0,
                        width: MediaQuery.of(context).size.width/2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Consumo",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "1.250 kW",
                              style: TextStyle(
                                fontSize: 38,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black87
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      color: Colors.white,
                      
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 250.0,
                        width: MediaQuery.of(context).size.width/2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Usuários ativos",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "23",
                              style: TextStyle(
                                fontSize: 38,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "-3%",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                      ),
                      color: Colors.white,
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        height: 200.0,
                        
                      ),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),

              // Container de cards a direita
              Container(
                padding: EdgeInsets.only(right: 4),
                width: MediaQuery.of(context).size.width/2,
                child: Column(
                  children: <Widget>[
                    Card(
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 230.0,
                        width: MediaQuery.of(context).size.width/2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Previsão",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "150 kW",
                              style: TextStyle(
                                fontSize: 38,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "+16% no consumo",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                      ),
                      color: Colors.white,
                      
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
                        height: 150.0,
                        width: MediaQuery.of(context).size.width/2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Ar-Condicionados\nAtivos",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "21",
                              style: TextStyle(
                                fontSize: 38,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              child: Row(

                                children: <Widget>[
                                  Text(
                                    "Atualizado 12/05 às 15:24",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.black45,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      color:Colors.white,
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        height: 150.0,
                        
                      ),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
