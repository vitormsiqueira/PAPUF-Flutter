import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papuf/widgets/app_button.dart';
import 'package:papuf/widgets/app_text.dart';

class ForgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark, // status bar brightness
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: _body(context),
    );
  }
}

_body(BuildContext context) {
  return Center(
    child: Container(
      color: Colors.white,
      child: Form(
        child: Container(
          child: ListView(
            children: <Widget>[
              Container(
                child: _img("assets/images/forgot.png"),
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
              ),
              SizedBox(
                height: 36,
              ),
              Container(
                child: Text(
                  "Esqueceu sua senha?",
                  style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                child: Text(
                  "Por favor, informe o E-mail associado a sua conta que enviaremos um link com instruções para recuperação de senha",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16),
              Container(
                child: AppText(
                  "Email",
                  hint: "Digite um email válido",
                  keyboardType: TextInputType.emailAddress,
                  mainColor: "#1c1c1c",
                  secondColor: "#000000",
                  isUnderLine: true,
                ),
              ),
              SizedBox(height: 30),
              Container(
                child: AppButton(
                  "ENVIAR",
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

_img(String img) {
  return Container(
    height: 150,
    child: Image.asset(
      img,
      fit: BoxFit.fitHeight,
    ),
  );
}
