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

    // Container responsavel pelo tamnaho da listview
    return new Container(
    // padding: EdgeInsets.only(left: 27, top: 7),
    height: 50,
    child: ListView(
      padding: EdgeInsets.all(3),
      scrollDirection: Axis.horizontal,
      children: List.generate(15, (int index) {
        // gera a lista
        return Container(
          height: 50,
          child: RawMaterialButton(
            onPressed: (){}, 
            child: Container(
              child: Text(
                "$index", 
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: .6,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            shape: new CircleBorder(),
            elevation: 3,
            fillColor: hexToColor("#4DE4B2"),
            
          ),
        );
        
      }),
    ),
  );

  }
}