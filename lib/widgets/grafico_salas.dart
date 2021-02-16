import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:papuf/color_hex.dart';

class GraficoSalas extends StatefulWidget {
  final List<Color> availableColors = [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];

  @override
  State<StatefulWidget> createState() => GraficoSalasState();
}

class GraficoSalasState extends State<GraficoSalas> {
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
              )
            ]
          ),
        
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          'Consumo entre salas',
                          style: TextStyle(
                            color: Colors.black, 
                            fontSize: 24, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Gráfico comparativo',
                          style: TextStyle(
                            color: Colors.black54, 
                            fontSize: 18, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 38,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: BarChart(
                            mainBarData(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, 
    {
    bool isTouched = false,
    
    double width = 12,
    List<int> showTooltips = const [],
    }
  ) 
  
  {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [hexToColor("#32347A")] : [hexToColor("#4163CD")],
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 20,
            colors: [Colors.grey[100]],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(15, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, 5, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, 5, isTouched: i == touchedIndex);
      case 3:
        return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
      case 4:
        return makeGroupData(4, 9, isTouched: i == touchedIndex);
      case 5:
        return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
      case 6:
        return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
      case 7:
        return makeGroupData(7, 5, isTouched: i == touchedIndex);
      case 8:
        return makeGroupData(8, 4.5, isTouched: i == touchedIndex);
      case 9:
        return makeGroupData(9, 3.2, isTouched: i == touchedIndex);
      case 10:
        return makeGroupData(10, 7.1, isTouched: i == touchedIndex);
      case 11:
        return makeGroupData(11, 9.1, isTouched: i == touchedIndex);
      case 12:
        return makeGroupData(12, 15.5, isTouched: i == touchedIndex);
      case 13:
        return makeGroupData(13, 5.5, isTouched: i == touchedIndex);
      case 14:
        return makeGroupData(14, 6.5, isTouched: i == touchedIndex);
      default:
        return null;
    }
  }
  
  );

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          
          tooltipBgColor: hexToColor("#32347A"),
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String salaItem;
            switch (group.x.toInt()) {
              case 0:
                salaItem = 'Sala 01';
                break;
              case 1:
                salaItem = 'Sala 02';
                break;
              case 2:
                salaItem = 'Sala 03';
                break;
              case 3:
                salaItem = 'Sala 04';
                break;
              case 4:
                salaItem = 'Sala 05';
                break;
              case 5:
                salaItem = 'Sala 06';
                break;
              case 6:
                salaItem = 'Sala 07';
                break;
              case 7:
                salaItem = 'Sala 08';
                break;
              case 8:
                salaItem = 'Sala 09';
                break;
              case 9:
                salaItem = 'Sala 10';
                break;
              case 10:
                salaItem = 'Sala 11';
                break;
              case 11:
                salaItem = 'Sala 12';
                break;
              case 12:
                salaItem = 'Sala 13';
                break;
              case 13:
                salaItem = 'Sala 14';
                break;
              case 14:
                salaItem = 'Sala 15';
                break;
            }
            return BarTooltipItem(
              salaItem + '\n' + (rod.y - 1).toString() + ' kWh', 
              TextStyle(
                color: Colors.white
              )
            );
          }
        ),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! FlPanEnd &&
                barTouchResponse.touchInput is! FlLongPressEnd) {
              touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) =>
            const TextStyle(
              color: Colors.black54, 
              fontWeight: FontWeight.bold, 
              fontSize: 14
            ),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return '1';
              case 1:
                return '2';
              case 2:
                return '3';
              case 3:
                return '4';
              case 4:
                return '5';
              case 5:
                return '6';
              case 6:
                return '7';
              case 7:
                return '8';
              case 8:
                return '9';
              case 9:
                return '10';
              case 10:
                return '11';
              case 11:
                return '12';
              case 12:
                return '13';
              case 13:
                return '14';
              case 14:
                return '15';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }

 
  
}