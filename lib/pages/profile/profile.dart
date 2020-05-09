import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:papuf/utils/auth.dart';
import 'package:papuf/utils/auth_provider.dart';
import 'package:papuf/widgets/text_appbar.dart';

import '../../color_hex.dart';


class ProfilePage extends StatelessWidget {

  final VoidCallback onSignedOut;

  ProfilePage({this.onSignedOut});
  
  Future<void> _signedOut(BuildContext context) async{
    try {
      final BaseAuth auth = AuthProvider.of(context).auth;
      await auth.signedOut(); // chamamos a função deslogar
      onSignedOut();
      // print("função deslogar");
    } catch (e) {
      print('errooooo $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    
    final double size_card = MediaQuery.of(context).size.height/2;

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark, // ativa barra de status claro
        title: textAppBar("Perfil", color: false),
        elevation: 0,
        backgroundColor: hexToColor("#4163CD"),
        actions: <Widget>[
          FlatButton(
            onPressed: () => _signedOut(context), 
            child: Text(
              "Sair",
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: _body(context, size_card),
    );
  }
}



_body(BuildContext context, double size_card, {void signedOut}) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // separa o container do perfil com o container do logout
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 16),
          width: MediaQuery.of(context).size.width,
          height: (size_card > 350.0) ? size_card : 350.0, // verifica se metade da tela é maior que a altura de 350px
          decoration: _boxDecorationCardBlue(),
          child: Column(
            children: <Widget>[

              _pictureProfileCenter("https://www.leadsdeconsorcio.com.br/blog/wp-content/uploads/2019/11/04-1.jpg"),
              
              _nameProfile('Test Lastname'),
              
              _infoProfile("Email:", "test@test.com"),

              _infoProfile("Senha:", "******"),
              
              _infoProfile("Nível de Acesso:", "Administrador"),

            ],
          ),
        ),

        //buttonSettingsLogout(context, "Configurações", iconButton: Icon(Icons.settings_applications, color: Colors.black54,)),
        //buttonSettingsLogout(context, "Sair", iconButton: Icon(Icons.exit_to_app, color: Colors.black54,)),
           
      ],
    ),
  );
}

_buttonSettingsLogout(BuildContext context ,String buttonName, {Icon iconButton, void signedOut}){
  return FlatButton(
    onPressed: () => signedOut, 
    child: Row(
      children: <Widget>[
        iconButton,
        SizedBox(
          width: 16.0,
        ),
        Align(
          alignment: Alignment.centerLeft, // permite o texto ser 'fixado' no inicio
          child: Text(
            buttonName,
            style: TextStyle(
              fontSize: 21.0,
              color: Colors.black54,
            ),
          ),
        ),

      ],
      
    )
  );
}



_pictureProfileCenter(String url){
  return Container(
    width: 120,
    height: 120,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(url),
      )
    ),
  );
}

_nameProfile(String name){
  return Padding(
    padding: const EdgeInsets.only(top: 16, bottom: 32),
    child: Text(name,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold
      ),
    ),
  );
}

_infoProfile(String left ,String right){
  return Padding(
    padding: const EdgeInsets.only(left: 25.0, bottom: 12.0, right: 25.0, top: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Text(
            left,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white54,
            ),
          ),
        ),
        Container(
          child: Text(
            right,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white54,
            ),
          ),
        ),
      ],
    ),
  );
}

_boxDecorationCardBlue(){
  return BoxDecoration(
    color: hexToColor("#4163CD"),
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(32),
      bottomLeft: Radius.circular(32),
    ),
  );
}
