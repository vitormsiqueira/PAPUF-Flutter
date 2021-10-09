import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';
import 'package:papuf/widgets/details_table.dart';
import 'package:papuf/widgets/grafico_salas.dart';
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
  SalaItem selectedUser;

  Future getAir() async {
    await FirebaseFirestore.instance
        .collection('bd-2')
        .where('state', isEqualTo: true)
        .get()
        .then((value) {
      if (value.docs != null && value.docs.length > 0) {
        value.docs.forEach(
          (element) {
            print(element['state']);
          },
        );
      } else {
        print('No documents found');
      }
    });
    //print('zdassfafef $data');
  }

  var air;

  List<SalaItem> salas = [
    SalaItem('Sala 01', false, false, 158.2),
    SalaItem('Sala 02', true, true, 158.2),
    SalaItem('Sala 03', false, true, 270.2),
    SalaItem('Sala 04', false, true, 158.2),
    SalaItem('Sala 05', true, false, 159.2),
    SalaItem('Sala 06', true, false, 158.2),
    SalaItem('Sala 07', true, false, 147.2),
    SalaItem('Sala 08', false, true, 158.2),
    SalaItem('Sala 09', false, true, 190.2),
    SalaItem('Sala 10', false, true, 278.2),
    SalaItem('Sala 11', true, true, 265.2),
    SalaItem('Sala 12', true, false, 258.2),
    SalaItem('Sala 13', true, false, 198.2),
    SalaItem('Sala 14', false, false, 168.2),
    SalaItem('Sala 15', false, true, 178.2),
  ];

  final List<ConsumoData> chartData = [
    ConsumoData(1, 15, '1'),
    ConsumoData(2, 28, '2'),
    ConsumoData(3, 34, '3'),
    ConsumoData(4, 32, '4'),
    ConsumoData(5, 20, '5'),
    ConsumoData(6, 35, '6'),
    ConsumoData(7, 38, '7'),
    ConsumoData(8, 34, '8'),
    ConsumoData(9, 36, '9'),
    ConsumoData(10, 29, '10'),
    ConsumoData(11, 32, '11'),
    ConsumoData(12, 28, '12'),
    ConsumoData(13, 34, '13'),
    ConsumoData(14, 39, '14'),
    ConsumoData(15, 19, '15')
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            //// status bar brightness
            systemOverlayStyle: SystemUiOverlayStyle.light,
            title: textAppBar("Dashboard", isDark: true),
            elevation: 0,
            backgroundColor: hexToColor("#4163CD"),
            bottom: PreferredSize(
              //// altura é de 48+5 do padding bottom na linha abaixo
              preferredSize: const Size.fromHeight(53.0),
              child: Container(
                padding:
                    EdgeInsets.only(left: 85, right: 85, bottom: 10, top: 10),
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
                      child: Align(
                        child: Text(
                          "Dia",
                          style: TextStyle(fontSize: 18),
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                    Tab(
                      child: Align(
                        child: Text(
                          "Mês",
                          style: TextStyle(fontSize: 18),
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                    Tab(
                      child: Align(
                        child: Text(
                          "Ano",
                          style: TextStyle(fontSize: 18),
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              _tabDia(context),
              _tabMes(context),
              _tabAno(),
            ],
          ),
        ));
  }

  //

  _tabDia(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Padding(
          // necessário ser 0, p/ o gráfico atingir as bordas
          padding: const EdgeInsets.all(0),
          child: Stack(
            children: [
              ////---------------------------------------
              //// Define o tamnho e cor dos containers de fundo
              Column(
                children: [
                  Container(
                    height: 500,
                    color: hexToColor("#4163CD"),
                  ),
                  Container(
                    height: 620,
                    color: Colors.white,
                  )
                ],
              ),
              ////---------------------------------------
              //// Calendário Dinâmico
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 15, bottom: 20, left: 10),
                /*child: FlutterDatePickerTimeline(
                      startDate: DateTime(2021, 05, 01),
                      endDate: DateTime.now(),
                      initialFocusedDate: DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      selectedItemBackgroundColor: hexToColor("#3B53C9"),
                      unselectedItemBackgroundColor: Colors.transparent,
                      selectedItemTextStyle: TextStyle(color: Colors.white),
                      unselectedItemTextStyle: TextStyle(color: Colors.white70),
                      itemRadius: 14,
                      selectedItemWidth: 150,
                      onSelectedDateChange: (DateTime dateTime) {
                        print(dateTime);
                      },
                    )*/
              ),
              ////---------------------------------------
              //// Texto Consumo
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 70),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Consumo",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ]),
              ),
              ////---------------------------------------
              //// Informações de Consumo
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 90),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "410",
                                style: TextStyle(
                                  fontSize: 72.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top:
                                        30.0), // deixa o "KWH" alinhado na base do valor do consumo
                                child: Text(
                                  "KWH",
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    color: Colors.white54,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
              ////---------------------------------------
              //// Gráfico de consumo
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 220),
                child: AspectRatio(
                  aspectRatio: 1.70,
                  child: Container(
                    child: LineChart(
                      mainData(),
                    ),
                  ),
                ),
              ),
              ////---------------------------------------
              //// KPI Qtde. Ar Consdicionados Ligados
              Container(
                // Cards de ares ligados
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 450),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 180,
                      //// Define a largura do Card para 90%
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                              color: hexToColor("#EBEBEB"), width: 1.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10.0,
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //-----------------------------------------
                          // Gráfico de Pizza (QTD.)
                          Container(
                            padding: EdgeInsets.all(20),
                            child: CircularPercentIndicator(
                              backgroundColor: Colors.grey[200],
                              radius: 120.0,
                              lineWidth: 12.0,
                              animation: true,
                              percent: 18 / 30,
                              center: Center(
                                child: Text(
                                  getAir().toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11),
                                ),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: hexToColor("#4163CD"),
                            ),
                          ),
                          //-----------------------------------------
                          // Titulo (Ares-Condionados)
                          Container(
                            padding: EdgeInsets.all(15),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Ares-\nCondicionados\nligados',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ////---------------------------------------
              //// Gráfico Consumo Entre Salas
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .9,
                    // Card - Comparação entre salas
                    padding: EdgeInsets.only(top: 650),
                    child: GraficoSalas(),
                  ),
                ],
              ),
              ////---------------------------------------
              //// Tabela Mais Detalhes
              Container(
                // Outros cards
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 1030),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      //margin: EdgeInsets.all(20),
                      height: 660,
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                              color: hexToColor("#EBEBEB"), width: 1.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10.0,
                            )
                          ]),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 30, top: 25),
                              child: Text(
                                'Mais detalhes',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Container(
                              child: Details(),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
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
      borderData: FlBorderData(
          show: false, border: Border.all(color: Colors.white, width: 0)),
      minX: 0,
      maxX: 11,
      minY: 1,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3.7),
            FlSpot(2.0, 3.2),
            FlSpot(4.5, 4.3),
            FlSpot(6.3, 3.7),
            FlSpot(8, 4.6),
            FlSpot(9.5, 2.2),
            FlSpot(10.5, 3),
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
              FlSpot(10.5, 5.1),
            ],
            isCurved: true,
            colors: [Colors.white],
            barWidth: 5,
            dotData: FlDotData(
              show: false,
            )),
      ],
    );
  }

  _tabMes(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Padding(
          // necessário ser 0, p/ o gráfico atingir as bordas
          padding: const EdgeInsets.all(0),
          child: Stack(
            children: [
              ////---------------------------------------
              //// Define o tamnho e cor dos containers de fundo
              Column(
                children: [
                  Container(
                    height: 500,
                    color: hexToColor("#4163CD"),
                  ),
                  Container(
                    height: 620,
                    color: Colors.white,
                  )
                ],
              ),
              ////---------------------------------------
              //// Calendário Dinâmico
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 15, bottom: 20, left: 10),
                /*child: FlutterDatePickerTimeline(
                    startDate: DateTime(2021, 05, 01),
                    endDate: DateTime.now(),
                    initialFocusedDate: DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectedItemBackgroundColor: hexToColor("#3B53C9"),
                    unselectedItemBackgroundColor: Colors.transparent,
                    selectedItemTextStyle: TextStyle(color: Colors.white),
                    unselectedItemTextStyle: TextStyle(color: Colors.white70),
                    itemRadius: 14,
                    selectedItemWidth: 150,
                    onSelectedDateChange: (DateTime dateTime) {
                      print(dateTime);
                    },
                  )*/
              ),
              ////---------------------------------------
              //// Texto Consumo
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 70),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Consumo",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ]),
              ),
              ////---------------------------------------
              //// Informações de Consumo
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 90),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "8720",
                                style: TextStyle(
                                  fontSize: 72.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top:
                                        30.0), // deixa o "KWH" alinhado na base do valor do consumo
                                child: Text(
                                  "KWH",
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    color: Colors.white54,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
              ////---------------------------------------
              //// Gráfico de consumo
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 220),
                child: AspectRatio(
                  aspectRatio: 1.70,
                  child: Container(
                    child: LineChart(
                      mainData(),
                    ),
                  ),
                ),
              ),
              ////---------------------------------------
              //// KPI
              Container(
                ////
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 450),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 220,
                      ////----------------------------------
                      //// Define a largura do card como 90%
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                              color: hexToColor("#EBEBEB"), width: 1.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10.0,
                            )
                          ]),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ////-----------------------------------------
                            //// Card Sala com Maior Consumo
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 30, right: 0, top: 25),
                                      child: Text(
                                        'Sala com maior Consumo',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 30, right: 0, top: 0),
                                      child: Text(
                                        'Gráfico comparativo',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                  ]),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .3,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Text(
                                          '11',
                                          style: TextStyle(
                                              color: hexToColor("#4163CD"),
                                              fontSize: 56,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ////-----------------------------------------
                                /// Cards Detalhes de consumo e atividade
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .59,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          'Consumo Total',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          '3.890 KWh',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          'Tempo de Atividade Total',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          '76:35h',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              ////---------------------------------------
              //// Gráfico Consumo Entre Salas
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .9,
                    // Card - Comparação entre salas

                    padding: EdgeInsets.only(top: 690),
                    child: GraficoSalas(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _tabAno() {
    return Container(
      color: Colors.lightBlueAccent,
    );
  }
}

class SalaItem {
  SalaItem(this.nomeSala, this.estadoArL, this.estadoArD, this.consumo);
  final String nomeSala;
  final bool estadoArL;
  final bool estadoArD;
  final double consumo;
}

class ConsumoData {
  ConsumoData(this.day, this.consumo, this.category);
  final double day;
  final double consumo;
  final String category;
}
