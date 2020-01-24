import 'package:flutter/material.dart';
import 'package:papuf/pages/home/bottom_nav_bar.dart';
import 'package:papuf/widgets/text_appbar.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light, // status bar brightness
        title: textAppBar("Notificações"),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: _body(),
      bottomNavigationBar: BottomNavyBar(),
    );
  }
}

_body() {
  return Container(
    color: Colors.white,
  );
}
