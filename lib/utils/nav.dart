import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page, {replace = false}) {
  //pushReplacement substitui a tela atual pela tela que está sendo direcionada, destruindo a atual
  if (replace) {
    return Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) {
      return page;
    }));
  }

  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return page;
  }));
}
