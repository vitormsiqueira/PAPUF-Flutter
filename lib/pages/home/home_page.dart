import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papuf/color_hex.dart';
import 'package:papuf/utils/connect_MQTT.dart';
import 'package:papuf/widgets/controle.dart';
import 'package:papuf/widgets/list_view_classes.dart';
import 'package:papuf/widgets/text_appbar.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onSignedOut;
  HomePage({this.onSignedOut});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variáveis responsável por fazer a "paginação" de informações da list Salas de Aulas
  bool pressed = false;
  int _selectedClass = 0;
  final _classOptions = [print("Sala 1")];

  // lista que gera a lista de salas presentes na tabBar, assim como algumas configurações
  final List<Tab> myTabs = List.generate(
    15,
    (index) => Tab(
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(color: hexToColor("#4DE4B2"), width: 1),
          shape: BoxShape.circle,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Center(
            child: Text(
              '$index',
              style: TextStyle(
                fontSize: 21,
              ),
            ),
          ),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        backgroundColor: Colors.yellow,
        // appBar: CustomAppBar(),
        appBar: AppBar(
          brightness: Brightness.light, // status bar brightness
          title: textAppBar("Salas de Aula"),
          elevation: 1,
          backgroundColor: Colors.white,
          /////
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(53.0), // altura é de 48+5 do padding bottom na linha abaixo
            
            child: Container(
              padding: EdgeInsets.only(bottom: 5),
              child: Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.white),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label, // essa função deixa a tab selecionada do mesmo tamamanho das não-selecionadas
                  isScrollable: true,
                  labelColor: Colors.white, // cor da label da tab selecionada
                  unselectedLabelColor: hexToColor("#4DE4B2"), // cor da label da tab não selecionada
                  indicator: BoxDecoration(
                    color: hexToColor("#4DE4B2"),
                    shape: BoxShape.circle,
                  ),
                  tabs: myTabs,
                ),
              ),
            ),
          ),
        ),
        body: _body(context),
      ),
    );
  }
}

_body(BuildContext context) {
  return Container(
    color: Colors.white,
    height: MediaQuery.of(context).size.height, //Add a full heigh white container 
    child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 30),
        //height: MediaQuery.of(context).size.height, // Permite expandir para toda a tela na altura
        child: Column(
          children: <Widget>[
            _textControle(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // centraliza os controles
              children: <Widget>[
                Controle(ar1, "temp-1", currentSala: 1),
                SizedBox(width: 40,),
                Controle(ar2, "temp-2", currentSala: 1),
              ],
            ),
            
            // _textDashboard(),
            // _dashboard(context),
          ],
        ),
      ),
  );
}

_dashboard(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30.0, left: 30, right: 30),
    child: Container(
      padding: EdgeInsets.only(top: 10, bottom: 10.0, left: 10, right: 10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                child: Icon(
                  Icons.trending_up,
                  color: hexToColor("#4163CD"),
                  size: 35,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15), //consertar isso daqui
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Consumo hoje",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "450 kW",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 55,
                child: RawMaterialButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.black45,
                    size: 30,
                  ),
                  shape: CircleBorder(),
                ),
              )
            ],
          ),
          
        ],
      ),
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15.0, // has the effect of softening the shadow
            spreadRadius: .5, // has the effect of extending the shadow
          )
        ],
      ),
    ),
  );
}

_textDashboard() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 30, bottom: 20),
          child: Text(
            "Dashboard",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )
    ],
  );
}

_textControle() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 30, bottom: 20),
          child: Text(
            "Controle | Sala ",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )
    ],
  );
}
