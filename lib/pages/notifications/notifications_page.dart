import 'package:flutter/material.dart';
import 'package:papuf/widgets/text_appbar.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light, // status bar brightness
        title: textAppBar("Notificações"),
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: _body(),
    );
  }
}

_body() {
  return Container(
    color: Colors.white,
    child: Center(
      child: Text(
        "Nenhuma notificação",
        style: TextStyle(
          fontSize: 20,
          color: Colors.black54
        ),
      ),
    ),
  );
}
