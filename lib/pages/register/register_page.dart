import 'package:flutter/material.dart';
import 'package:papuf/widgets/app_button.dart';
import 'package:papuf/widgets/app_text.dart';
import 'package:papuf/widgets/text_appbar.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

var _currencies = [
  "Professor(a)",
  "Técnico(a)",
  "Administrador(a)",
  "Desenvolvedor(a)",
];
String _selectedCurrencie;

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light, // status bar brightness
        title: textAppBar("Cadastrar"),
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: _body(context),
    );
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
                  padding: EdgeInsets.all(16),
                  child: AppText(
                    "Nome", 
                    keyboardType: TextInputType.emailAddress,
                    mainColor: "#555555",
                    secondColor: "#000000",
                    myFontSize: 16,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: DropdownButtonFormField(
                    hint: Text(
                      'Selecione o tipo de acesso'
                    ),
                    value: _selectedCurrencie,
                    onChanged: (newValue){
                      setState(() {
                        _selectedCurrencie = newValue;
                      });
                    },
                    items: _currencies.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: AppText(
                    "Email", 
                    hint: "Digite um email válido",
                    keyboardType: TextInputType.emailAddress,
                    mainColor: "#555555",
                    secondColor: "#000011",
                    myFontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(16),
                  child: AppButton(
                    "ENVIAR",
                    onPressed: (){},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}