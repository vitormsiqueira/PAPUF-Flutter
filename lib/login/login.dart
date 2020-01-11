import 'package:flutter/material.dart';
import 'package:papuf/color_hex.dart';
import 'package:papuf/widgets/app_button.dart';
import 'package:papuf/widgets/app_text.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _controllerLogin = TextEditingController();

  final _focusPassword = FocusNode();

  final _controllerPass = TextEditingController();

  bool _showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            SizedBox(height: 25),
            Container(
              child: Text(
                "Bem Vindo ao PaPUF",
                style: TextStyle(
                  color: hexToColor("#4163CD"),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: _img("assets/images/logo_bloco.jpg"),
              constraints: BoxConstraints(maxHeight: 300),
              height: 350,
            ),
            Expanded(
              child: Container(
                height: 450,
                color: hexToColor("#4163CD"),
                padding: EdgeInsets.only(
                  left: 38,
                  right: 38,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey, //chave do formulário que controla o estado
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 450,
                          child: ListView(
                            children: <Widget>[
                              AppText(
                                "Login",
                                "Digite seu login",
                                controller: _controllerLogin,
                                validator: _validateLogin,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                nextFocus:
                                    _focusPassword, //define o proximo foco ao clicar
                              ),
                              SizedBox(height: 25),
                              AppText(
                                "Senha",
                                "Digite sua senha",
                                keyboardType: TextInputType.number,
                                password: true,
                                controller: _controllerPass,
                                validator: _validatePass,
                                focusNode: _focusPassword,
                              ),
                              SizedBox(height: 25),
                              AppButton(
                                "ENTRAR",
                                onPressed: _onClickLogin,
                                showProgress: _showProgress,
                              ),
                              SizedBox(height: 25),
                              AppButton(
                                "Cadastrar",
                                onPressed: _onClickLogin,
                                showProgress: _showProgress,
                                backGroundColor: "#4163CD",
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onClickLogin() async {
    //valida o estado atual do form
    bool formOk = _formKey.currentState.validate();

    if (!formOk) {
      return;
    }

    //faz a leitura da label e armazena na variavel
    String login = _controllerLogin.text;
    String password = _controllerPass.text;

    //_controllerLogin.text = "Flutter"; //forma de mostrar um texto na label

    print("Login: $login, Senha: $password"); //printa o valor digitado na label

    setState(() {
      _showProgress = true;
    });

    setState(() {
      _showProgress = false;
    });
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Digite o login";
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
      height: 250,
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }
}
