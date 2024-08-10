import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imageApp = "images/padrao.png";
  var _mensagem ="?";

  void _opcaoSelecionada(String escolhaUsuario){

    var opcoes = ["pedra","papel","tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    // Exibição da imagem escolhida pelo app
    switch( escolhaApp ){
      case "pedra":
        setState(() {
          _imageApp = "images/pedra.png";
        });
        break;
      case "papel":
        setState(() {
          _imageApp = "images/papel.png";
        });
        break;
      case "tesoura":
        setState(() {
          _imageApp = "images/tesoura.png";
        });
        break;
    }

    //Exibição da mensagem do resultado
    if(escolhaApp == escolhaUsuario){
      _mensagem = "E M P A T E";
    }else if(
        (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel")
    ){
      _mensagem = "VOCÊ PERDEU !!!";
    }else if(
        (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")
    ){
      _mensagem = "VOCÊ GANHOU !!!";
    }else{
      _mensagem = "ponto cego !!!";
    }
    print("Usurario = $escolhaUsuario  ");
    print("App      = $escolhaApp => $numero");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'J   O   K   E   N   P   O',
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Escolha do app:",
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
          ),
          Image.asset(_imageApp),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Faça sua escolha",
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset(
                    "images/papel.png",
                    width: 100,
                    height: 100,
                    fit:BoxFit.fill
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(
                    "images/pedra.png",
                    width: 100,
                    height: 100,
                    fit:BoxFit.fill),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset(
                    "images/tesoura.png",
                    width: 100,
                    height: 100,
                    fit:BoxFit.fill),
              ),
            ]
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              _mensagem,
              style: const TextStyle(fontSize: 40,fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
          ),
        ]
      ),
    );
  }
}