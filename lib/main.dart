import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papuf/utils/auth.dart';
import 'package:papuf/utils/auth_provider.dart';
import 'package:papuf/utils/root_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
  //setDataEstrutura();
}

void setDataEstrutura() {
  for (int i = 1; i <= 15; i++) {
    var dadosUpdate = {
      "ar-l": {
        "consumo": {
          "2020": {
            'jul': {
              "9": [5, 3, 9, 9]
            }
          }
        }
      },
      "ar-r": {
        "consumo": {
          "2020": {
            'jul': {
              "19": [5, 3, 9, 9]
            }
          }
        }
      }
    };
    var dados = {
      "ar-l": {
        "id": "${i}-dvf",
        "state": "off",
        "temperature": "19",
        "time-activity": "2:37 h",
        "consumo": {
          "2020": {
            "7": {
              "10": [1, 4, 3, 7, 6]
            }
          }
        }
      },
      "ar-r": {
        "id": "${i}-kjh",
        "state": "off",
        "temperature": "19",
        "time-activity": "23:14 h",
        "consumo": {
          "2020": {
            "7": {
              "26": [1, 4, 3, 7, 6]
            }
          }
        }
      },
      "details": {"name": "sala $i", "bloco": "BD-1", "andar": "Piso 1"}
    };
    Firestore.instance.collection('bd-2').document('sala-$i').setData(dados);
    print('update $i');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
        color: Colors.white,
        title: 'PAPUF!',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: RootPage(),
      ),
    );
  }
}
