import 'package:flutter/material.dart';
import 'package:papuf/pages/dashboard/dashboard_page.dart';
import 'package:papuf/pages/home/home_page.dart';
import 'package:papuf/pages/notifications/notifications_page.dart';
import 'package:papuf/pages/profile/profile.dart';
import 'package:papuf/widgets/text_appbar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool pressed = false;
  int _selectedPage = 0;
  final _pageOptions = [
    HomePage('Admin'),
    NotificationsPage(),
    DashboardPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.5,
        currentIndex: _selectedPage,
        backgroundColor: Colors.black,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.blueAccent,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.blueGrey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: Colors.blueAccent,
            ),
            title: Text(
              'Notifications',
              style: TextStyle(color: Colors.blueGrey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
              color: Colors.blueAccent,
            ),
            title: Text(
              'Dashboard',
              style: TextStyle(color: Colors.blueGrey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.blueAccent,
            ),
            title: Text(
              'Search',
              style: TextStyle(color: Colors.blueGrey),
            ),
          ),
        ],
      ),
    );
  }
}
