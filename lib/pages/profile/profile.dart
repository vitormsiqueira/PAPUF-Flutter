import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:papuf/pages/settings/settings_page.dart';
import 'package:papuf/utils/auth.dart';
import 'package:papuf/utils/auth_provider.dart';
import 'package:papuf/utils/nav.dart';
import 'package:papuf/utils/root_pages.dart';
import 'package:papuf/widgets/text_appbar.dart';

import '../../color_hex.dart';


// Variável global responsável por guardar o valor do switch do Dark Mode.
bool isSwitched = false;

class ProfilePage extends StatefulWidget {

  // Variável responsável por realizar o logout.
  final VoidCallback onSignedOut;

  ProfilePage({this.onSignedOut});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final BaseAuth auth = Auth();

  // //
  // Future<void> _signedOut(BuildContext context) async{
  //   try {
  //     final BaseAuth auth = AuthProvider.of(context).auth;
  //     await auth.signedOut(); // chamamos a função deslogar
  //     widget.onSignedOut();
  //     // print("função deslogar");
  //   } catch (e) {
  //     print('errooooo $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    
    final double size_card = MediaQuery.of(context).size.height/2;

    return Scaffold(
      appBar: AppBar(
        // ativa barra de status claro
        brightness: Brightness.dark, 
        title: textAppBar("Perfil", color: false),
        elevation: 0,
        backgroundColor: hexToColor("#4163CD"),
      ),
      body: _body(context, size_card),
    );
  }

  // Body Construction
  _body(BuildContext context, double size_card, {void signedOut}) {
    return SingleChildScrollView(
      child: Column(
        // separa o container do perfil com o container do logout
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 16),
            width: MediaQuery.of(context).size.width,
            // verifica se metade da tela é maior que a altura de 350px.
            // Se sim, permanece o valor da metade da tela.
            // Se não, define o valor de 350px.
            height: (size_card > 350.0) ? size_card : 350.0,
            decoration: _boxDecorationCardBlue(),
            child: Column(
              children: <Widget>[
                // Mostra a foto de perfil.
                _pictureProfileCenter("https://www.leadsdeconsorcio.com.br/blog/wp-content/uploads/2019/11/04-1.jpg"),
                // Mostra o nome do usuário.
                _nameProfile('Test Lastname'),
                // Mostra o email.
                _infoProfile("Email:", "test@test.com"),
                // Mostra a senha.
                _infoProfile("Senha:", "******"),
                // Mostra o neivel de acesso.
                _infoProfile("Nível de Acesso:", "Administrador"),
              ],
            ),
          ),

          // Adiciona um espaço vertical
          SizedBox(
            height: 16.0,
          ),
         
         // Constroi os botões de Configurações e Logout.
          _buttonSettingsLogout(context, "Configurações", iconButton: Icon(Icons.settings_applications, color: Colors.black54,)),
          _buttonSettingsLogout(context, "Sair", iconButton: Icon(Icons.exit_to_app, color: Colors.black54,), logout: true),
              
        ],
      ),
    );
  }

  // Show modal bottom sheet construction
  void _onButtonPressedSettings(BuildContext context) {
    showModalBottomSheet(
      // Adiciona bordas arredondadas nos cantos superiores.
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      context: context, 
      builder: (context) {
        return Container(
          child: Column(
            children: <Widget>[
              // Adiciona espaço vertical.
              SizedBox(
                height: 16,
              ),

              // Cria uma switch list
              SwitchListTile(
                title: Text("Dark mode"),
                value: isSwitched, 
                onChanged: (value){
                  setState((){
                    isSwitched = value;
                    print(isSwitched);
                  });
                },
                activeTrackColor: Colors.blue,
                activeColor: Colors.white,
              ),

              SizedBox(
                height: 16,
              ),

              // Cria um button
              ListTile(
                title: Text(
                  "Precisa de ajuda?",
                ),
                onTap: (){},
              ),

              SizedBox(
                height: 16,
              ),

              // Mostra ainformação do aplicativo
              ListTile(
                title: Text(
                  "Versão do aplicativo",
                ),
                subtitle: Text(
                  "v1.0201"
                ),
              ),
              
            ],
          ),
        );
      }
    );
  }

  /// Button settings and logout creation.
  _buttonSettingsLogout(BuildContext context ,String buttonName, {Icon iconButton, bool logout = false}){

    // Inicia a variavel responsável pela autenticação.
    final BaseAuth auth = Auth();

    return ListTile(
      leading: iconButton, // Ícone à esquerda do titulo.
      title: Text(
        buttonName,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black54,
        ),
      ),
      // Verifica se o botão construido é o de "Logout". 
      onTap: logout ? 
        // Se sim, aplica a função de deslogar. 
        () async {
          await auth.signedOut();
          push(context, RootPage(), replace: true);
        } : 
        // Se não, navega até a tela de configurações.
        () => _onButtonPressedSettings(context),
    );
  }
}

_pictureProfileCenter(String url){
  return Container(
    // Define o tamanho da imagem.
    width: 120,
    height: 120,
    // Deixa a imagem redonda.
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(url),
      )
    ),
  );
}

// Função responsável para mostra o nome do usuário
_nameProfile(String name){
  return Padding(
    padding: const EdgeInsets.only(top: 16, bottom: 32),
    child: Text(
      name,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold
      ),
    ),
  );
}

// Função responsável por apresentar as informações do perfil do usuário.
_infoProfile(String left ,String right){
  return Padding(
    padding: const EdgeInsets.only(left: 25.0, bottom: 12.0, right: 25.0, top: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Text(
            // Informação presente à esquerda no card.
            left,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white54,
            ),
          ),
        ),
        Container(
          child: Text(
            // Informação presente à direita no card.
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

// Função responsável por definir o card azul superior que irá mostrar a foto 
// e as informações do usuário.
_boxDecorationCardBlue(){
  return BoxDecoration(
    color: hexToColor("#4163CD"),
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(32),
      bottomLeft: Radius.circular(32),
    ),
  );
}
