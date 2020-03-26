import 'package:flutter/material.dart';
import 'package:papuf/pages/dashboard/dashboard_page.dart';
import 'package:papuf/pages/home/home_page.dart';
import 'package:papuf/pages/notifications/notifications_page.dart';
import 'package:papuf/pages/profile/profile.dart';
import 'package:papuf/utils/custom_icons/p_a_p_u_f_icons.dart';
import '../../color_hex.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool pressed = false;
  int _selectedPage = 0;
  final _pageOptions = [
    HomePage('admin'),
    DashboardPage(),
    NotificationsPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              PAPUF.home_outline,
              size: 21,
              color: _selectedPage == 0 ? hexToColor("#4163CD") : Colors.black54,
            ),
            title: Text(
              'Home',
              style: TextStyle(fontWeight: FontWeight.bold, color: _selectedPage == 0 ? hexToColor("#4163CD") : Colors.black54),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              PAPUF.chart_bar_outline,
              size: 21,
              color: _selectedPage == 1 ? hexToColor("#4163CD") : Colors.black54,
            ),
            title: Text(
              'Dashboard',
              style: TextStyle(fontWeight: FontWeight.bold, color: _selectedPage == 1 ? hexToColor("#4163CD") : Colors.black54),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              PAPUF.bell,
              size: 21,
              color: _selectedPage == 2 ? hexToColor("#4163CD") : Colors.black54,
            ),
            title: Text(
              'Notificações',
              style: TextStyle(fontWeight: FontWeight.bold, color: _selectedPage == 2 ? hexToColor("#4163CD") : Colors.black54),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              PAPUF.user_outline,
              size: 21,
              color: _selectedPage == 3 ? hexToColor("#4163CD") : Colors.black54,
            ),
            title: Text(
              'Perfil',
              style: TextStyle(fontWeight: FontWeight.bold, color: _selectedPage == 3 ? hexToColor("#4163CD") : Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
