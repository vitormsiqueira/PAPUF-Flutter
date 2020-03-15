import 'package:flutter/material.dart';

import '../color_hex.dart';
import 'controle.dart';


class ListClasses extends StatefulWidget {
  @override
  _ListClassesState createState() => _ListClassesState();
}

class _ListClassesState extends State<ListClasses> {
  bool pressed = false;
  int _selectedPage = 0;
  final _pageOptions = [
    print("Sala 0")
  ];
  @override
  Widget build(BuildContext context) {
    return new Container(
    
    padding: EdgeInsets.only(left: 27, top: 7),
    height: 35,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(15, (int index) {
        // gera a lista
        return Card(
          elevation: 0,
          child: InkWell(
            onTap: (){
              setState(() {
                
              });
            },
            borderRadius: BorderRadius.circular(20),
            splashColor: hexToColor("#4DE4B2"),
            highlightColor: hexToColor("#4DE4B2"),
            focusColor: Colors.black,
            child: Container(
              height: 36,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: hexToColor("#4DE4B2")),
                color: pressed ? hexToColor("#4DE4B2") : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  "Sala $index",
                  style: pressed
                      ? TextStyle(
                          fontSize: 16,
                          letterSpacing: .6,
                          color: Colors.white,
                        )
                      : TextStyle(
                          color: hexToColor("#4DE4B2"),
                          fontSize: 16,
                          letterSpacing: .6,
                        ),
                ),
              ),
            ),
          ),
        );
      }),
    ),
  );

  }
}