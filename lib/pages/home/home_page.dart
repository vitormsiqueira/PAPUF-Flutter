import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:papuf/color_hex.dart';
import 'package:papuf/utils/connect_MQTT.dart';
import 'package:papuf/widgets/controle.dart';
import 'package:papuf/widgets/text_appbar.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variáveis responsável por fazer a "paginação" de informações da list Salas de Aulas
  bool pressed = false;
  int _selectedClass = 0;
  final _classOptions = [print("Sala 1")];
  int currentClassRoom = 1;
  
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
              (index+1).toString(),
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
        // backgroundColor: Colors.yellow,
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
                  onTap: (index){
                    setState(() {
                      print(index+1);
                      currentClassRoom = index+1;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
        body: _body(context),
      ),
    );
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
              _textControle("Controle | Sala $currentClassRoom"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // centraliza os controles
                children: <Widget>[
                  Controle(ar1, "temp-1", currentSala: currentClassRoom),
                  SizedBox(width: 40,),
                  Controle(ar2, "temp-2", currentSala: currentClassRoom),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // ListTile(
              //   leading: Icon(Icons.details),
              //   title: Text(
              //     "Detalhes",
              //     style: TextStyle(
              //       fontSize: 20,
              //       color: Colors.black54,
              //     ),
              //   ),
              //   onTap: () => _onButtonPressedDetails(context),
              // ),
              _textControle("Detalhes"),
              _cardDetails(currentClassRoom, "Piso 1", "BD-1", "45:07", "45:18"),
              // _textDashboard(),
              // _dashboard(context),
            ],
          ),
        ),
    );
  }

  _textControle(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 30, bottom: 20),
            child: Text(
              text,
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

  _cardDetails(int textSala, String textAndar, String textBloco, String tempAtividadeArLeft, String tempAtividadeArRight) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Container(
        // padding: EdgeInsets.all(15),
        height: 260,
        width: MediaQuery.of(context).size.width,
        // color: Colors.black45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 15.0,
            )
          ],
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            _textDetails(Icon(MdiIcons.schoolOutline, color: Colors.black54,), "Sala ", "$textSala"),
            _textDetails(Icon(Icons.business, color: Colors.black54,),"Bloco ", textBloco),
            _textDetails(Icon(Icons.layers, color: Colors.black54,),"Andar ", textAndar),
            _textDetails(Icon(MdiIcons.clockOutline, color: Colors.black54,),"Tempo Atividade\nAr esquerda ", tempAtividadeArLeft),
            _textDetails(Icon(MdiIcons.clockOutline, color: Colors.black54,),"Tempo Atividade\nAr direita ", tempAtividadeArRight),
          ],
        ),

      ),
    );
  }

  _textDetails(Icon iconButton, String label, String myText){
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30, top: 7, bottom: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              iconButton,
              SizedBox(
                width: 16,
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
                ),
              ),
            ],
           ),
          Text(
            myText,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
         
        ],
      ),
    );
  }
}