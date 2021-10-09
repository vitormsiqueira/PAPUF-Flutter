import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:papuf/pages/dashboard/dashboardpage2.dart';
import 'package:papuf/pages/home/home_page.dart';
import 'package:papuf/pages/notifications/notifications_page.dart';
import 'package:papuf/pages/profile/profile.dart';
import '../../color_hex.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool pressed = false;
  int _selectedPage = 0;
  final _pageOptions = [
    HomePage(),
    DashboardPage2(),
    NotificationsPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: Container(
        // Adiciona borda na parte superior do bottonavigationbar
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.black26,
              width: .5,
            ),
          ),
        ),
        // Criação do elemento
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            // Listagem dos itens que compõe o bottomnavigationbar
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.home,
                size: 20,
                color:
                    _selectedPage == 0 ? hexToColor("#4163CD") : Colors.black38,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: hexToColor("#4163CD"),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.chartPie,
                size: 20,
                color:
                    _selectedPage == 1 ? hexToColor("#4163CD") : Colors.black38,
              ),
              title: Text(
                'Dashboard',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: hexToColor("#4163CD"),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.solidBell,
                size: 20,
                color:
                    _selectedPage == 2 ? hexToColor("#4163CD") : Colors.black38,
              ),
              title: Text(
                'Notificações',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: hexToColor("#4163CD"),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.userAlt,
                size: 20,
                color:
                    _selectedPage == 3 ? hexToColor("#4163CD") : Colors.black38,
              ),
              title: Text(
                'Perfil',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: hexToColor("#4163CD"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
