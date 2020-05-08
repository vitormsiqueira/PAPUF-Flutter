import 'package:flutter/material.dart';
import 'package:papuf/widgets/text_appbar.dart';

class ForgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light, // status bar brightness
        title: textAppBar("Esqueci a Senha"),
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
  );
}