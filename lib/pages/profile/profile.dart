import 'package:flutter/material.dart';
import 'package:papuf/widgets/text_appbar.dart';

import '../../color_hex.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textAppBar("Perfil", color: false),
        elevation: 0,
        backgroundColor: hexToColor("#4163CD"),
      ),
      body: _body(context),
    );
  }
}

_body(BuildContext context) {
  return Column(
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(top: 16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/2,
        decoration: BoxDecoration(
          color: hexToColor("#4163CD"),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(32),
            bottomLeft: Radius.circular(32)
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage("https://avatars3.githubusercontent.com/u/42281886?v=4"),
                      )
                    ),
                  ),  
                ],
              ),
              
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 32),
                child: Text('Test .com',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Email:",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "test@test.com",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Senha:",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "******",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Nível de acesso",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Administrador",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
        
      ),
    ],
  );
}
