import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projetct_quiz_god/src/models/mock/mock_dara_personagens.dart';
import 'package:projetct_quiz_god/src/ui/pages/PageWin.dart';


class GameProvider extends ChangeNotifier {
  double totalAmount = 15000.0; // Defina o valor inicial do saldo
  double? totalAmountFinal; // Defina o valor inicial do saldo
  Map<String, dynamic> quemSouEu = {};
  String respostaCorreta = "";
  List<String> pistasCompradas = [];
  List<String> personagensAcertados = [];
  List<IconData> lifeIcons = [Icons.electric_bolt, Icons.electric_bolt, Icons.electric_bolt];// Lista de dicas compradas
  List<String> tentativas = [];


  void iniciarNovoJogo() {
    _initializeRandomPersonagem();
    notifyListeners();
  }
  void _initGame() {
    totalAmount = 15000.0;
    quemSouEu = {}; // Adicione os valores padrão ou lógica necessária
    respostaCorreta = "";
    pistasCompradas = [];
    lifeIcons = [Icons.electric_bolt, Icons.electric_bolt, Icons.electric_bolt];
    tentativas = [];
    personagensAcertados = [];
  }

  void _initializeRandomPersonagem() {
    List<String> personagensAcertados = [];
    final personagens = MockDataPersonagens.getMockPersonagens();
    final randomIndex = Random().nextInt(personagens.length);
    _setPersonagem(personagens[randomIndex]);
  }



  defeat(){
    if(totalAmount == 0){
      print("perdeu plaiba");

    }
  }// Lista de dicas compradas

  addP_Acertado(String r){
    personagensAcertados.add(r);
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


  /*void _handleRespostaCorreta(BuildContext context) {
    totalAmountFinal = totalAmount;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PageWin()),
    );
  }*/
  void _handleRespostaCorreta(BuildContext context, String personagem) {

    totalAmount += 1000;
    quemSouEu = {}; // Adicione os valores padrão ou lógica necessária
    respostaCorreta = "";
    pistasCompradas = [];
    tentativas = [];
    personagensAcertados.add(personagem);
    iniciarNovoJogo();
    addTips();
    print(personagensAcertados);
    notifyListeners();
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




  void reset() {
    _initGame();
    notifyListeners();
  }


  void addTips() {
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
