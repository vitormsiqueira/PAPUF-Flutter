import 'package:flutter/material.dart';

import '../../color_hex.dart';

class BottomNavyBar extends StatefulWidget {
  @override
  _BottomNavyBarState createState() => _BottomNavyBarState();
}

class _BottomNavyBarState extends State<BottomNavyBar> {
  int selectedIndex = 0;

  List<NavigationItem> items = [
    NavigationItem(Icon(Icons.home), Text("Home")),
    NavigationItem(Icon(Icons.notifications), Text("Notificações")),
    NavigationItem(Icon(Icons.dashboard), Text("Dashboard")),
    NavigationItem(Icon(Icons.person), Text("Perfil")),
  ];

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 275),
        height: double.maxFinite,
        width: isSelected ? 150 : 50,
        padding: isSelected ? EdgeInsets.only(left: 16, right: 16) : null,
        decoration: isSelected
            ? BoxDecoration(
                color: Colors.cyan[50],
                borderRadius: BorderRadius.all(Radius.circular(25)))
            : null,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconTheme(
                  data: IconThemeData(
                      size: 28,
                      color:
                          isSelected ? hexToColor("#4163CD") : Colors.black87),
                  child: item.icon,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: isSelected
                      ? DefaultTextStyle.merge(
                          style: TextStyle(color: hexToColor("#4163CD")),
                          child: item.title)
                      : Container(),
                )
              ],
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 7, bottom: 7),
      width: MediaQuery.of(context).size.width,
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
          var itemIndex = items.indexOf(item);
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = itemIndex;
              });
            },
            child: _buildItem(item, selectedIndex == itemIndex),
          );
        }).toList(),
      ),
    );
  }
}

class NavigationItem {
  final Icon icon;
  final Text title;

  NavigationItem(this.icon, this.title);
}
