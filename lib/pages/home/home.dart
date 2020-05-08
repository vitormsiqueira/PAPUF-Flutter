import 'package:flutter/material.dart';
import 'package:papuf/pages/dashboard/dashboard_page.dart';
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
    DashboardPage(),
    NotificationsPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedPage], 
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Colors.white,
        ),
        child: new BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon:  _selectedPage == 0 ? 
                Icon(
                  MdiIcons.home,
                  color: hexToColor("#4163CD"),
                )
              : 
                Icon(
                  MdiIcons.homeOutline,
                  color: Colors.black54,
                  ),
              title: Text(
                'Home',
                style: TextStyle(fontWeight: FontWeight.bold, color: _selectedPage == 0 ? hexToColor("#4163CD") : Colors.black54),
              ),
            ),
            BottomNavigationBarItem(
              icon:  _selectedPage == 1 ? 
                Icon(
                  MdiIcons.chartLineStacked,
                  color: hexToColor("#4163CD"),
                )
              : 
                Icon(
                  MdiIcons.chartLine,
                  color: Colors.black54,
                  ),
              title: Text(
                'Dashboard',
                style: TextStyle(fontWeight: FontWeight.bold, color: _selectedPage == 1 ? hexToColor("#4163CD") : Colors.black54),
              ),
            ),
            BottomNavigationBarItem(
              icon:  _selectedPage == 2 ? 
                Icon(
                  MdiIcons.bell,
                  color: hexToColor("#4163CD"),
                )
              : 
                Icon(
                  MdiIcons.bellOutline,
                  color: Colors.black54,
                  ),
              title: Text(
                'Notificações',
                style: TextStyle(fontWeight: FontWeight.bold, color: _selectedPage == 2 ? hexToColor("#4163CD") : Colors.black54),
              ),
            ),
            BottomNavigationBarItem(
              icon:  _selectedPage == 3 ? 
                Icon(
                  MdiIcons.account,
                  color: hexToColor("#4163CD"),
                )
              : 
                Icon(
                  MdiIcons.accountOutline,
                  color: Colors.black54,
                  ),
              title: Text(
                'Perfil',
                style: TextStyle(fontWeight: FontWeight.bold, color: _selectedPage == 3 ? hexToColor("#4163CD") : Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
