import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papuf/widgets/text_appbar.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark, // status bar brightness
        title: textAppBar("Notificações", isDark: false),
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.black26,
                  width: .5,
                ),
              ),
            ),
          ),
          preferredSize: const Size.fromHeight(0.0),
        ),
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
        style: TextStyle(fontSize: 20, color: Colors.black54),
      ),
    ),
  );
}
