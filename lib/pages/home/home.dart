import 'package:flutter/material.dart';
import 'package:papuf/pages/dashboard/dashboard_page.dart';
import 'package:papuf/pages/home/home_page.dart';
import 'package:papuf/pages/notifications/notifications_page.dart';
import 'package:papuf/pages/profile/profile.dart';
import 'package:papuf/widgets/text_appbar.dart';

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
    NotificationsPage(),
    DashboardPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              Icons.home,
              color: _selectedPage == 0 ? hexToColor("#4163CD") : Colors.grey,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: _selectedPage == 0 ? hexToColor("#4163CD") : Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
              color: _selectedPage == 1 ? hexToColor("#4163CD") : Colors.grey,
            ),
            title: Text(
              'Dashboard',
              style: TextStyle(color: _selectedPage == 1 ? hexToColor("#4163CD") : Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: _selectedPage == 2 ? hexToColor("#4163CD") : Colors.grey,
            ),
            title: Text(
              'Notificações',
              style: TextStyle(color: _selectedPage == 2 ? hexToColor("#4163CD") : Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: _selectedPage == 3 ? hexToColor("#4163CD") : Colors.grey,
            ),
            title: Text(
              'Perfil',
              style: TextStyle(color: _selectedPage == 3 ? hexToColor("#4163CD") : Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
