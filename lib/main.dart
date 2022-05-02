// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
  Stateless -> Widgets que não podem ser alterados (constantes)
  Stateful -> Widgets que podem ser alterados (variáveis)
*/

void main(){

  runApp(MaterialApp(
    //debugShowCheckedModeBanner: false,
    title: "Frases do dia",
    home: Home(),
    ),
  );

}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _frases = [
    "Sou apenas uma frase aleatória",
    "Novas amizades serão sempre bem-vindas para darem cor ao seu dia",
    "Gratidão é a única coisa que não se pode comprar",
    "Nem toda mudança importante é a mudança do sorriso",
  ];

  var _fraseGerada = "Clique abaixo para gerar uma frase!";

  void _gerarFrase(){
    var numeroSorteado = Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada = _frases[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.green,
      ),     
      body: Center(
        child: Container(
        padding: EdgeInsets.all(16),
        //width: double.infinity,
        /*decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.amber),
        ),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("images/logo.png"),
            Text(
              _fraseGerada,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                color: Colors.black
              ),
            ),
            RaisedButton(
              child: Text(
                "Nova Frase",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              color: Colors.green,
              onPressed: _gerarFrase,
            ),
          ],
        ),
      ),
      ),
    );
  }
}