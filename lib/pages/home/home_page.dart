import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:papuf/color_hex.dart';
import 'package:papuf/utils/connect_MQTT.dart';
import 'package:papuf/widgets/controle.dart';
import 'package:papuf/widgets/text_appbar.dart';
import 'package:papuf/pages/current_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:papuf/widgets/jsonToSend.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variáveis responsável por fazer a "paginação" de informações da list Salas de Aulas
  bool pressed = false;
  //int _selectedClass = currentClassRoom;
  //final _classOptions = [print("Sala 1")];
  //int currentClassRoom;

  ///////////////////////
  bool selected1 = false;
  bool selected2 = false;
  bool um = false;
  bool dois = false;
  //////////////////////

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
              (index + 1).toString(),
              style: TextStyle(
                fontSize: 21,
              ),
            ),
          ),
        ),
      ),
    ),
  );

  // Constroi a AppBar com a seleção das salas de aula
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // Armazena o estado selecionado na Tab
      initialIndex: currentClassRoom - 1,
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          // status bar brightness
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          title: textAppBar("Salas de Aula", isDark: false),
          elevation: 0,
          backgroundColor: Colors.white,
          /////
          bottom: PreferredSize(
            // altura é de 48+5 do padding bottom na linha abaixo
            preferredSize: const Size.fromHeight(53.0),
            child: Container(
              // Adiciona borda na parte inferior
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black26,
                    width: .5,
                  ),
                ),
              ),
              padding: EdgeInsets.only(bottom: 5),
              child: TabBar(
                // essa função deixa a tab selecionada do mesmo tamamanho das não-selecionadas
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                // cor da label da tab selecionada
                labelColor: Colors.white,
                // cor da label da tab não selecionada
                unselectedLabelColor: hexToColor("#4DE4B2"),
                indicator: BoxDecoration(
                  color: hexToColor("#4DE4B2"),
                  shape: BoxShape.circle,
                ),
                tabs: myTabs,
                onTap: (index) {
                  setState(() {
                    currentClassRoom = index + 1;
                    print("test print $currentClassRoom");
                  });
                },
              ),
            ),
          ),
        ),
        body: _body(context),
      ),
    );
  }

  _body(BuildContext context) {
    String currentSala = currentClassRoom.toString();

    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('bd-2')
          .doc('sala-$currentSala')
          .snapshots(includeMetadataChanges: true),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        // print(snapshot.data['ar-l']['temperature']);
        // print(snapshot.data['ar-r']['temperature']);
        if (!snapshot.hasData) return LinearProgressIndicator();
        // String consumoMesArL = calculoDeConsumoMes(snapshot, "ar-l").toString();
        // String consumoMesArR = calculoDeConsumoMes(snapshot, "ar-r").toString();
        /*
        return Column(
          children: <Widget>[
            Text(snapshot.data['ar-l']['state'].toString()),
            Text(snapshot.data['ar-l']['temperature'].toString()),
          ],
        );
        */
        return Container(
          color: Colors.white,
          height: MediaQuery.of(context)
              .size
              .height, //Add a full heigh white container
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 30),
            //height: MediaQuery.of(context).size.height, // Permite expandir para toda a tela na altura
            child: Column(
              children: <Widget>[
                _textControle("Controle"),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // centraliza os controles
                  children: <Widget>[
                    // Aqui passamos as informações de controle: Temperatura, tópico e o  numero da sala
                    _modulo(
                        1,
                        snapshot.data['ar-l']['temperature'],
                        snapshot.data['ar-l']['state'],
                        "bd-2",
                        'sala-$currentSala'),
                    SizedBox(
                      width: 40,
                    ),

                    // Aqui passamos as informações de controle: Temperatura, tópico e o  numero da sala
                    _modulo(
                        2,
                        snapshot.data['ar-r']['temperature'],
                        snapshot.data['ar-r']['state'],
                        "bd-2",
                        'sala-$currentSala'),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                _textControle("Detalhes"),

                // Adiciona informações coletadas do firebase no card Detalhes
                _cardDetails(
                    snapshot.data['details']['name'],
                    snapshot.data['details']['andar'],
                    snapshot.data['details']['bloco'],
                    snapshot.data['ar-l']['time-activity'],
                    snapshot.data['ar-r']['time-activity']),
              ],
            ),
          ),
        );
      },
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

  _cardDetails(String textSala, String textAndar, String textBloco,
      String tempAtividadeArLeft, String tempAtividadeArRight) {
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
          border: Border.all(color: hexToColor("#EBEBEB"), width: 1.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0, // has the effect of softening the shadow
              spreadRadius: 0.5, // has the effect of extending the shadow
            )
          ],
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 25,
            ),

            _textDetails(
                Icon(
                  MdiIcons.schoolOutline,
                  color: Colors.black54,
                ),
                "Sala",
                textSala.toString()),
            //_textDetails(Icon(MdiIcons.schoolOutline, color: Colors.black54,), "Sala ", "$textSala"),
            _textDetails(
                Icon(
                  Icons.business,
                  color: Colors.black54,
                ),
                "Bloco ",
                textBloco),
            _textDetails(
                Icon(
                  Icons.layers,
                  color: Colors.black54,
                ),
                "Andar ",
                textAndar),
            _textDetails(
                Icon(
                  MdiIcons.clockOutline,
                  color: Colors.black54,
                ),
                "Tempo Atividade\nAr esquerda ",
                tempAtividadeArLeft),

            _textDetails(
                Icon(
                  MdiIcons.clockOutline,
                  color: Colors.black54,
                ),
                "Tempo Atividade\nAr direita ",
                tempAtividadeArRight),
          ],
        ),
      ),
    );
  }

  _textDetails(Icon iconButton, String label, String myText) {
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
                    color: Colors.black54),
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

  /////////////////////////////////
  _modulo(int controle, int temp, bool selected, String collection,
      String document) {
    //final _controller = StreamController<int>();

    // Define qual ar sera atualizado o estado
    String changeAr = controle == 1 ? "ar-l" : "ar-r";

    // Define o valor da variável responvel por alterar o estado atual
    bool changeState = selected ? false : true;

    var db = FirebaseFirestore.instance;

    return Container(
      padding: EdgeInsets.all(15),
      width: 150,
      height: 350,
      decoration: _controleBoxDecoration(selected),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            child: selected
                ? _img("assets/images/icon_ar_branco.png")
                : _img("assets/images/icon_ar_cinza.png"),
          ),
          SizedBox(
            height: 10,
          ),
          RawMaterialButton(
            onPressed: selected
                ? () {
                    setState(() {
                      temp++;
                      db
                          .collection(collection)
                          .doc(document)
                          .update({"$changeAr.temperature": temp});
                    });
                    //envia um json {"temp": temp, "state": "on"} com temperatura e estado
                    //publishM(createJsonTempState(temp.toString(), _setStateOn(i)), topic);
                  }
                : null,
            child: _textOthers(selected, '+', 45, FontWeight.w400, context),
            shape: CircleBorder(),
          ),
          SizedBox(
            height: 5,
          ),
          // Temperatura
          Container(
            child: _textOthers(
                selected, temp.toString() + 'º', 45, FontWeight.w300, context),
          ),

          // Botão ' - '
          RawMaterialButton(
            onPressed: selected
                ? () async {
                    setState(() {
                      temp--;
                      db
                          .collection(collection)
                          .doc(document)
                          .update({"$changeAr.temperature": temp});
                    });
                    //publishM(createJsonTempState(temp.toString(), _setStateOn(i)), topic);
                  }
                : null,
            child: _textOthers(selected, '-', 50, FontWeight.w400, context),
            shape: CircleBorder(),
          ),

          SizedBox(
            height: 10,
          ),

          // Container que mostra o botão On/Off
          Container(
            width: 60,
            height: 60,
            child: RawMaterialButton(
              onPressed: () async {
                setState(() {
                  // publishM(createJsonTempState("0" ,selected), topic);
                  db
                      .collection(collection)
                      .doc(document)
                      .update({"$changeAr.state": changeState});
                });
              },
              child: _textOnOff(selected),
              shape: CircleBorder(),
            ),
          ),
        ],
      ),
    );
  }

  _controleBoxDecoration(bool selected) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: selected ? hexToColor("#4163CD") : Colors.white,
      border: Border.all(
          color: selected ? hexToColor("#3359D0") : hexToColor("#EBEBEB"),
          width: 1.0),
      boxShadow: [
        BoxShadow(
          color: selected ? hexToColor("#838BDA") : Colors.black12,
          blurRadius: 10.0, // has the effect of softening the shadow
          spreadRadius: 0.5, // has the effect of extending the shadow
        ),
      ],
    );
  }

  _textOnOff(bool selected) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Center(
        child: selected
            ? _img("assets/images/icon_shutdown_branco.png")
            : _img("assets/images/icon_shutdown_cinza.png"),
      ),
    );
  }

  _textOthers(bool selected, String texto, int size, FontWeight myFontWeight,
      BuildContext context) {
    //print(texto);
    return Center(
      child: Text(
        texto,
        style: TextStyle(
          fontSize: size.toDouble(),
          color: selected ? Colors.white : hexToColor("#cccccc"),
          fontWeight: myFontWeight,
        ),
      ),
    );
  }
}

_img(String img) {
  return Container(
    height: 60,
    child: Image.asset(
      img,
      fit: BoxFit.cover,
    ),
  );
}
