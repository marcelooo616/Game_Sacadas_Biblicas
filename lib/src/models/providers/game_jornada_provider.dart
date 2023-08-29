import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projetct_quiz_god/src/models/mock/mock_dara_personagens.dart';
import 'package:projetct_quiz_god/src/ui/pages/PageWin.dart';


class GameJornadaProvider extends ChangeNotifier {
  double totalAmount = 40000.0; // Defina o valor inicial do saldo
  double? totalAmountFinal; // Defina o valor inicial do saldo
  Map<String, dynamic> quemSouEu = {};
  List<String> personagensAcertados = [];
  String respostaCorreta = "";
  List<String> pistasCompradas = [];
  List<IconData> lifeIcons = [Icons.electric_bolt, Icons.electric_bolt, Icons.electric_bolt];// Lista de dicas compradas
  List<String> tentativas = [];


  defeat(){
    if(totalAmount == 0){
      print("perdeu plaiba");

    }
  }// Lista de dicas compradas

  void _initGame() {
    totalAmount = 15000.0;
    quemSouEu = {}; // Adicione os valores padrão ou lógica necessária
    respostaCorreta = "";
    pistasCompradas = [];
    lifeIcons = [Icons.electric_bolt, Icons.electric_bolt, Icons.electric_bolt];
    tentativas = [];
  }

  void n(){
    quemSouEu = {}; // Adicione os valores padrão ou lógica necessária
    respostaCorreta = "";
    pistasCompradas = [];
  }

  /*void _initializeRandomPersonagem() {
    print("Iniciando personagem");
    final personagens = MockDataPersonagens.getMockPersonagens();
    final randomIndex = Random().nextInt(personagens.length);
    _setPersonagem(personagens[randomIndex]);

  }*/

  void _initializeRandomPersonagem() {
    final personagens = MockDataPersonagens.getMockPersonagens();
    int randomIndex;

    do {
      randomIndex = Random().nextInt(personagens.length);
    } while (personagensAcertados.contains(personagens[randomIndex]['nome']));

    _setPersonagem(personagens[randomIndex]);
  }


  void _setPersonagem(Map<String, dynamic> personagem) {
    quemSouEu = personagem;
    respostaCorreta = personagem["nome"];
    notifyListeners(); // Notifica os ouvintes de mudanças no provider
  }

  void respond(String resposta, BuildContext context) {
    if (resposta == respostaCorreta) {
      _handleRespostaCorreta(context, resposta);
    } else {
      _handleRespostaErrada(resposta);
    }
  }

  void _handleRespostaCorreta(BuildContext context, String r)  {
   try{
     totalAmount += 1000;
     addP_Acertado(r);
     print("kdfnhskldçfsdf");
     n();
     _initializeRandomPersonagem();
   }catch(e){
     print(e.toString());
   }
  }

   void addP_Acertado(String r){
    personagensAcertados.add(r);
  }

  void _handleRespostaErrada(String resposta) {
    if (resposta != respostaCorreta) {
      tentativas.add(resposta);
      if (lifeIcons.isNotEmpty) {
        lifeIcons.removeLast();
      } else if (totalAmount >= 1000) {
        totalAmount -= 1000;
      } else {
        // Fim de Jogo
        print("Fim de Jogo");
      }
      print("Errado!");
      notifyListeners();
    }
  }

  void iniciarNovoJogo() {
    print("Iniciando jogo");
    _initializeRandomPersonagem();
    notifyListeners();
  }



  void reset() {
    _initGame();
    notifyListeners();
  }


  void addTips() {
    print("Add pista");
    pistasCompradas.add(getRandomTip(quemSouEu));
    notifyListeners();
  }

  String getRandomTip(Map<String, dynamic> character) {
    List<String> tips = character['dicas'];
    List<String> unusedTips = tips.where((tip) => !pistasCompradas.contains(tip)).toList();

    if (unusedTips.isEmpty) {
      return "Todas as dicas foram compradas.";
    }

    int randomIndex = Random().nextInt(unusedTips.length);
    return unusedTips[randomIndex];
  }

  void spendPoints(double valor) {
    totalAmount -= valor;
    notifyListeners();
  }
}
