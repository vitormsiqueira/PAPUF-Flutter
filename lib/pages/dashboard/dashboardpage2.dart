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
          brightness: Brightness.light, // status bar brightness
          title: textAppBar("Dashboard"),
          elevation: 0,
          backgroundColor: Colors.white,
          
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(53.0), // altura é de 48+5 do padding bottom na linha abaixo
            
            child: Container(
              padding: EdgeInsets.only(left: 85, right: 85, bottom: 10, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              height: 50,
              child: TabBar(
                
                unselectedLabelColor: hexToColor("#4DE4B2"),
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
    color: Colors.white,
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
                    decoration: BoxDecoration(color: Colors.white),
                    child: FlutterDatePickerTimeline(
                      startDate: DateTime(2021, 01, 01),
                      endDate: DateTime.now(),
                      initialFocusedDate: DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      selectedItemBackgroundColor: Colors.grey[50],
                      unselectedItemBackgroundColor: Colors.transparent,
                      selectedItemTextStyle: TextStyle(color: hexToColor("#026cff")),
                      unselectedItemTextStyle: TextStyle(color: Colors.grey[400]),
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
                      color: Colors.white, 
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
                                color: Colors.black,
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
                                        color: hexToColor("#026cff"),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text("KWH", 
                                      style: TextStyle(
                                        fontSize: 24.0,
                                        color: Colors.grey[400],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.arrow_drop_up,  // Add this
                                      color: hexToColor("#026cff"),
                                      size: 35.0,
                                    ),
                                    Text(
                                      "Sala 12", 
                                      style: TextStyle(
                                        fontSize: 19.0,
                                        color: hexToColor("#026cff"),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,  // Add this
                                      color: hexToColor("#026cff"),
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
      borderData: FlBorderData(show: false, border: Border.all(color: Colors.grey[50], width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.1, 2),
            FlSpot(4.5, 4.9),
            FlSpot(6.3, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 5.1),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
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