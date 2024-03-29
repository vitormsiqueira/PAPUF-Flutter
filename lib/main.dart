import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papuf/utils/auth.dart';
import 'package:papuf/utils/auth_provider.dart';
import 'package:papuf/utils/root_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:papuf/widgets/grafico_salas.dart';
import 'package:splashscreen/splashscreen.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
  //setDataEstrutura();
  /*
  var db = FirebaseFirestore.instance;
  QuerySnapshot resultado = await db.collection('bd-2').get();

  resultado.docs.forEach((d) {
    print(d.id);
    print(d.metadata);
  });
  */
}

/*
void setDataEstrutura() {
  for (int i = 1; i <= 15; i++) {
    var dadosUpdate = {
      "ar-l": {
        "consumo": {
          "2020": {
            'dez': {
              "29": [5, 3, 9, 9]
            }
          }
        }
      },
      "ar-r": {
        "consumo": {
          "2020": {
            'dez': {
              "29": [5, 3, 9, 9]
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
    FirebaseFirestore.instance.collection('bd-2').doc('sala-$i').set(dados);
    print('update $i');
  }
}
*/

class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyAwesomeApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container();
      },
    );
  }
}

class SomethingWentWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text(
        'Não inicializado',
        style: TextStyle(fontSize: 22),
      ),
    ));
  }
}

class MyAwesomeApp extends StatelessWidget {
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
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 3,
        navigateAfterSeconds: RootPage(),
        loaderColor: Colors.transparent,
      ),
      Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            image: AssetImage("assets/images/logo-faeng.png"),
          ),
        ),
      ),
    ],
  );
}
