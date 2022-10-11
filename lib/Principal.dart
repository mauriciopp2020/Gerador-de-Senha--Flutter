import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';

class Principal extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Principal> {
  TextEditingController _controllerTamanho = TextEditingController(text: "");

  String senha = "";

  bool letrasMaiusculas = true;
  bool letrasMinusculas = true;
  bool numeros = true;
  bool simbolos = true;

  senhaGerada(bool letrasMai, bool letrasMin, bool numeros, bool simbolos) {
    if (letrasMai == false &&
        letrasMin == false &&
        numeros == false &&
        simbolos == false) {
    } else {
      String letrasMaiusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
      String letrasMinusculas = "abcdefghijklmnopqrstuvwxyz";
      String numbers = "0123456789";
      String symbolos = "!@#\$%&*(){}[]-_=+<>,./";

      int tam = int.parse(_controllerTamanho.text);

      String senhaGer = "";
      senhaGer += (letrasMai ? letrasMaiusculas : "");
      senhaGer += (letrasMin ? letrasMinusculas : "");
      senhaGer += (numeros ? numbers : "");
      senhaGer += (simbolos ? symbolos : "");

      String pass = "";

      for (int i = 0; i < tam; i++) {
        int random = Random.secure().nextInt(senhaGer.length);
        pass += senhaGer[random];
        setState(() {
          senha = pass;
        });
      }

      return senha;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 200, 233, 218),
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return AppBar(
      toolbarHeight: 130,
      title: ListTile(
        contentPadding: EdgeInsets.only(left: 30, right: 20, top: 20),
        title: Text(
          'Gerador de Senha',
          style: TextStyle(
            color: Color.fromARGB(255, 250, 250, 250),
            fontWeight: FontWeight.w900,
          ),
        ),
        trailing: CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(
              "http://mpesolucoes.com.br/blog/wp-content/uploads/2019/03/POL%C3%8DTICA-DE-SEGURAN%C3%87A-CIBERN%C3%89TICA-EM-RECONSTRU-%C3%87%C3%83O-MPE.png"),
        ),
      ),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xfffff),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      transform: Matrix4.identity()..translate(1.0, 40.0),
                      height: 50,
                      width: MediaQuery.of(context).size.width * .90,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 250, 250, 250),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    Text(
                      "Opções",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 43, 155, 247)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Tamanho |-------------------------------->",
                          style: TextStyle(
                            color: Color.fromARGB(255, 8, 8, 8),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 6,
                          child: TextField(
                            controller: _controllerTamanho,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "LABCDEFGHIJKLMNOPQRSTUVWXYZ |--->",
                          style: TextStyle(
                            color: Color.fromARGB(255, 8, 8, 8),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Switch(
                          value: letrasMaiusculas,
                          //checkColor: Color.fromARGB(255, 12, 12, 12),
                          activeColor: Color.fromARGB(255, 74, 228, 74),
                          onChanged: (bool? value) {
                            setState(() {
                              letrasMaiusculas = value!;
                            });
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "abcdefghijklmnopqrstuvwxyz |------------>",
                          style: TextStyle(
                            color: Color.fromARGB(255, 8, 8, 8),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Switch(
                          value: letrasMinusculas,
                          //checkColor: Color.fromARGB(255, 0, 0, 0),
                          activeColor: Color.fromARGB(255, 74, 228, 74),
                          onChanged: (bool? value) {
                            setState(() {
                              letrasMinusculas = value!;
                            });
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "0123456789 |---------------------------->",
                          style: TextStyle(
                            color: Color.fromARGB(255, 8, 8, 8),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Switch(
                          value: numeros,
                          //checkColor: Color.fromARGB(255, 0, 0, 0),
                          activeColor: Color.fromARGB(255, 74, 228, 74),
                          onChanged: (bool? value) {
                            setState(() {
                              numeros = value!;
                            });
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "!@#\$%&*(){}[]-_=+<>,./ |------------------>",
                          style: TextStyle(
                            color: Color.fromARGB(255, 8, 8, 8),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Switch(
                          value: simbolos,
                          //checkColor: Color.fromARGB(255, 15, 15, 15),
                          activeColor: Color.fromARGB(255, 74, 228, 74),
                          onChanged: (bool? value) {
                            setState(() {
                              simbolos = value!;
                            });
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * .90,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 250, 250, 250),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              "$senha",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 11, 185, 5)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _botaoGerarSenha(),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Container(),
          ],
        ),
      ),
    );
  }

  _botaoGerarSenha() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.blueAccent),
      child: TextButton(
        child: Text(
          "Gerar senha",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        onPressed: () {
          senhaGerada(
            letrasMaiusculas,
            letrasMinusculas,
            numeros,
            simbolos,
          );
        },
      ),
    );
  }
}
