import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papuf/utils/auth.dart';
import 'package:papuf/utils/auth_provider.dart';

import 'pages/login/login.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
        color: Colors.white,
        title: 'PAPUF!',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: LoginPage(),
      ),
    );
  }
}
