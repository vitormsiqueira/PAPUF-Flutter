import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';
import 'package:papuf/widgets/text_appbar.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
    height: MediaQuery.of(context).size.height,
    color: hexToColor("#4163CD"),
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
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
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Text("Consumo", 
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            height: 130,
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
                                      padding: const EdgeInsets.only(bottom:10.0),
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
                                    IconButton(
                                      onPressed: (){
                                      },
                                      icon: Icon(
                                        Icons.arrow_drop_up,  // Add this
                                        color: Colors.white,
                                        size: 35.0,
                                      )
                                    ),
                                    Container(
                                      child: Text(
                                        "Sala 12", 
                                        style: TextStyle(
                                          fontSize: 19.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: (){
                                      },
                                      icon: Icon(
                                        Icons.arrow_drop_down,  // Add this
                                        color: Colors.white,
                                        size: 35.0,
                                      )
                                    ),
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

                          Container(
                            margin: EdgeInsets.all(20),
                            height: 200,
                            width: MediaQuery.of(context).size.width-20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[100],
                                  blurRadius: 1.0,
                                )
                              ]
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircularPercentIndicator(
                                  radius: 120.0,
                                  lineWidth: 11.0,
                                  animation: true,
                                  percent: 0.85,
                                  center: new Text(
                                    "26",
                                    style:
                                        new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                  ),
                                  
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: hexToColor("#4163CD"),
                                ),
                                Container(
                                  child: Text(
                                    "Salas Cadastradas", 
                                    style: TextStyle(
                                      fontSize: 19.0,
                                      color: hexToColor("#4163CD"),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )

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
            FlSpot(0, 3.7),
            FlSpot(2.0, 3.2),
            FlSpot(4.5, 4.3),
            FlSpot(6.3, 3.7),
            FlSpot(8, 4.6),
            FlSpot(9.5, 2.2),
            FlSpot(11, 4.2),
          ],
          isCurved: true,
          colors: [Colors.blueAccent.withOpacity(0.35)],
          barWidth: 5,
          dotData: FlDotData(
            show: false,
          ),
        ),
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.1, 2.1),
            FlSpot(4.5, 4.9),
            FlSpot(6.3, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 5.1),
          ],
          isCurved: true,
          colors: [Colors.white,],
          barWidth: 5,
          dotData: FlDotData(
            show: false,
          )
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