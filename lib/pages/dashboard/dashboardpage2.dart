import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:papuf/widgets/text_appbar.dart';

import '../../color_hex.dart';

class DashboardPage2 extends StatefulWidget {
  @override
  _DashboardPage2State createState() => _DashboardPage2State();
}

class _DashboardPage2State extends State<DashboardPage2> {
   // Variáveis responsável por fazer a "paginação" de informações da list Salas de Aulas
  bool pressed = false;
  
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light, // status bar brightness
          title: textAppBar("Dashboard"),
          elevation: 0.5,
          backgroundColor: Colors.white,
          
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(53.0), // altura é de 48+5 do padding bottom na linha abaixo
            
            child: Container(
              padding: EdgeInsets.only(left: 70, right: 70, bottom: 10, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              height: 50,
              child: TabBar(
                
                unselectedLabelColor: hexToColor("#4DE4B2"),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: hexToColor("#4DE4B2"),
                 
                ),
                labelColor: Colors.white,
                tabs: [
                  Tab(
                    child:  Align(
                        child: Text("Dia", style: TextStyle(fontSize: 18),),
                        alignment: Alignment.center,
                      ),
                    
                  ),
                  Tab(
                    child: Align(
                      child: Text("Mês", style: TextStyle(fontSize: 18),),
                      alignment: Alignment.center,
                    ),
                  ),
                   Tab(
                    child: Align(
                      child: Text("Ano", style: TextStyle(fontSize: 18),),
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ),
          )
        ),
        body: TabBarView(
          children: [
            _tabDia(context),
            _tabMes(),
            _tabAno()
          ],
        ),
      )
    );
  }
}

_tabDia(BuildContext context) {
  // lista que gera a lista de salas presentes na tabBar, assim como algumas configurações
  final List<String> _choices = ['01','02','03','04','05','06','07','08','09','10','11','12','13','14','15'];
  bool _defaultChoiceIndex = false;
  return Container(
    height: MediaQuery.of(context).size.height,
    color: Colors.white,
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  
                )
              ]
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2-35.0, //subtrair o valor do padding
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white, 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[100],
                          blurRadius: 15.0,
                        )
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Consumo", 
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Text("Sala 12", 
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: hexToColor("#026cff"),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down,  // Add this
                                color: hexToColor("#026cff"),
                              )
                            ],
                            
                          ),
                        ]
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    color: Colors.purpleAccent, 
                    width: MediaQuery.of(context).size.width/2-35.0,
                    height: 150,
                  ),
                ),
              ],
            )  
          ],
        ),
      ),
    ),
  );
}

_tabMes() {
  return Container(
    color: Colors.lightGreenAccent,
  );
}

_tabAno() {
  return Container(
    color: Colors.lightBlueAccent,
  );
}