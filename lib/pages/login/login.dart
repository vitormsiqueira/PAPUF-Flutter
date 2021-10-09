import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:papuf/color_hex.dart';
import 'package:papuf/pages/forget_pass/forget_page.dart';
import 'package:papuf/pages/register/register_page.dart';
import 'package:papuf/utils/auth.dart';
import 'package:papuf/utils/auth_provider.dart';
import 'package:papuf/utils/nav.dart';
import 'package:papuf/utils/root_pages.dart';
import 'package:papuf/widgets/app_button.dart';
import 'package:papuf/widgets/app_button_outline.dart';
import 'package:papuf/widgets/app_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({this.onSignedIn});
  final VoidCallback onSignedIn;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _controllerLogin = TextEditingController();

  final _focusPassword = FocusNode();

  final _controllerPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _body(),
    );
  }

  _body() {
    return Stack(
      children: <Widget>[
        /*Container(
          //height: 100,
          color: hexToColor("#4163CD"),
        ), */
        Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(top: 0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "Bem Vindo ao PAPUF!",
                      style: TextStyle(
                        color: hexToColor("#4163CD"),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: _img("assets/images/logo_bloco.jpg"),
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "O app que automatiza a sua\n sala de aula",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 310.0),
            child: Form(
              key: _formKey, //chave do formulário que controla o estado
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  color: hexToColor("#4163CD"),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                padding: EdgeInsets.only(left: 50, right: 50, top: 35),
                child: ListView(
                  primary: false, //desabilita o scroll padrão do ListView
                  children: <Widget>[
                    AppText(
                      "Login",
                      hint: "Digite seu usuário",
                      controller: _controllerLogin,
                      validator: _validateLogin,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      //define o proximo foco ao clicar
                      nextFocus: _focusPassword,
                      isBackGround: false,
                      iconForm: FontAwesomeIcons.solidEnvelope,
                      isUnderLine: true,
                    ),
                    SizedBox(height: 25),
                    AppText(
                      "Senha",
                      hint: "Digite sua senha",
                      keyboardType: TextInputType.text,
                      password: true,
                      controller: _controllerPass,
                      validator: _validatePass,
                      focusNode: _focusPassword,
                      isBackGround: false,
                      iconForm: FontAwesomeIcons.lock,
                      isUnderLine: true,
                    ),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          push(context, ForgetPage(), replace: false);
                        },
                        child: Text(
                          "Esqueceu a senha?",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    AppButton(
                      "ENTRAR",
                      onPressed: onClickLogin,
                    ),
                    SizedBox(height: 25),
                    AppButtonOutline(
                      "Cadastrar",
                      onPressed: _onClickRegister,
                      backGroundColor: "#4163CD",
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> onClickLogin() async {
    //valida o estado atual do form
    bool formOk = _formKey.currentState.validate();

    //faz a leitura da label e armazena na variavel
    String login = _controllerLogin.text;
    String password = _controllerPass.text;

    //_controllerLogin.text = "Flutter"; //forma de mostrar um texto na label

    print("Login: $login, Senha: $password"); //printa o valor digitado na label

    try {
      final BaseAuth auth = AuthProvider.of(context).auth;
      final String userId =
          await auth.signInWithEmailAndPassword(login, password);
      print('Signed in: $userId');

      // widget.onSignedIn(); // doesn't work

      // redireciona para a RootPage que verifica se foi logado. Se sim, redireciona para Home, com substituição da tela atual
      push(context, RootPage(), replace: true);
    } catch (e) {
      print('Error: $e');
    }
  }

  _onClickRegister() async {
    push(context, RegisterPage(), replace: false);
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Digite o login";
    }
    if (text.length < 3) {
      return "O login deve ser maior que 3 caracteres";
    }
    return null;
  }

  String _validatePass(String text) {
    if (text.isEmpty) {
      return "Digite a senha";
    }
    if (text.length < 3) {
      return "A senha deve ser maior que 3 caracteres";
    }
    return null;
  }

  _img(String img) {
    return Container(
      height: 210,
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }
}
