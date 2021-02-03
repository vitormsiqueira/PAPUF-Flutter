import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';
import 'package:papuf/widgets/text_appbar.dart';

import '../../color_hex.dart';

class DashboardPage2 extends StatefulWidget {
  @override
  _DashboardPage2State createState() => _DashboardPage2State();
}

class _DashboardPage2State extends State<DashboardPage2> {
   // Variáveis responsável por fazer a "paginação" de informações da list Salas de Aulas
  bool pressed = false;
  
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark, // status bar brightness
          title: textAppBar("Dashboard", color: false),
          elevation: 0,
          backgroundColor: hexToColor("#4163CD"),
          
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(53.0), // altura é de 48+5 do padding bottom na linha abaixo
            
            child: Container(
              padding: EdgeInsets.only(left: 85, right: 85, bottom: 10, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              height: 50,
              child: TabBar(
                
                unselectedLabelColor: Colors.white,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
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



  _tabDia(BuildContext context) {
  // lista que gera a lista de salas presentes na tabBar, assim como algumas configurações
  final List<String> _choices = ['01','02','03','04','05','06','07','08','09','10','11','12','13','14','15'];
  bool _defaultChoiceIndex = false;


  return Container(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          children: [
            Container(
              height: 450,
              color: hexToColor("#4163CD"),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                      
                      Container(
                          padding: const EdgeInsets.only(top: 11, bottom: 11),
                          child: FlutterDatePickerTimeline(
                            startDate: DateTime(2021, 01, 01),
                            endDate: DateTime.now(),
                            initialFocusedDate: DateTime.now(),
                            initialSelectedDate: DateTime.now(),
                            selectedItemBackgroundColor: hexToColor("#4169E1"),
                            unselectedItemBackgroundColor: Colors.transparent,
                            selectedItemTextStyle: TextStyle(color: Colors.white),
                            unselectedItemTextStyle: TextStyle(color: Colors.white70),
                            itemRadius: 15,
                            onSelectedDateChange: (DateTime dateTime) {
                              print(dateTime);
                            },
                          )),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width, //subtrair o valor do padding
                          //height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            //color: Colors.white, 
                            /*boxShadow: [
                              BoxShadow(
                                color: Colors.grey[100],
                                blurRadius: 15.0,
                              )
                            ]*/
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30, top: 20),
                                  child: Text("Consumo", 
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text("410", 
                                            style: TextStyle(
                                              fontSize: 72.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 10),
                                            child: Text("KWH", 
                                              style: TextStyle(
                                                fontSize: 24.0,
                                                color: Colors.white54,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.arrow_drop_up,  // Add this
                                            color: Colors.white,
                                            size: 35.0,
                                          ),
                                          Text(
                                            "Sala 12", 
                                            style: TextStyle(
                                              fontSize: 19.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,  // Add this
                                            color: Colors.white,
                                            size: 35.0,
                                          )
                                        ],
                                      ),
                                    ],
                                    
                                  ),
                                ),

                                Stack(
                                  children: <Widget>[
                                    AspectRatio(
                                      aspectRatio: 1.70,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(0),
                                          child: LineChart(
                                            mainData(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ]
                            ),
                          ),
                        ),
                      ),
                    ],
                  )  
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 0),
              margin: EdgeInsets.all(20),
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
            )
          ],
        ),
      ),
    ),
  );
}

  LineChartData mainData() {
    return LineChartData(
      titlesData: FlTitlesData(
        show: false,
        leftTitles: SideTitles(
          showTitles: false,
        ),
       
      ),
      borderData: FlBorderData(show: false, border: Border.all(color: Colors.white, width: 0)),
      minX: 0,
      maxX: 10,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3.3),
            FlSpot(0.5, 3.4),
            FlSpot(1.0, 3.9),
            FlSpot(1.5, 3.7),
            FlSpot(2.0, 2.5),
            FlSpot(2.5, 2.0),
            FlSpot(3.0, 2.0),
            FlSpot(3.5, 2.3),
            FlSpot(4.0, 3.0),
            FlSpot(4.5, 3.5),
            FlSpot(5.0, 3.7),
            FlSpot(5.5, 3.5),
            FlSpot(6.0, 2.7),
            FlSpot(6.5, 2.4),
            FlSpot(7.0, 2.4),
            FlSpot(7.5, 2.9),
            FlSpot(8.0, 3.2),
            FlSpot(8.5, 3.2),
            FlSpot(9.0, 2.3),
            FlSpot(9.5, 2.1),
          ],
          isCurved: true,
          colors: [Colors.white,],
          barWidth: 5,
          dotData: FlDotData(
            show: false,
          )
        ),
        LineChartBarData(
          spots: [
            FlSpot(0, 5),
            FlSpot(2.1, 5.4),
            FlSpot(4.5, 4.0),
            FlSpot(6.3, 2.7),
            FlSpot(8, 5.0),
            FlSpot(9.5, 1.5),
            FlSpot(11, 6.1),
          ],
          isCurved: true,
          colors: [Colors.blueAccent.withOpacity(0.2)],
          barWidth: 5,
          dotData: FlDotData(
            show: false,
          ),
          
        ),
      ],
    );
  }
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