import 'package:flutter/material.dart';
import 'package:projetct_quiz_god/src/models/providers/game_provider.dart';
import 'package:projetct_quiz_god/src/models/services/GameActionsService.dart';
import 'package:provider/provider.dart';

class GameActionsServiceImpl implements GameActions {

  String response = "";

  @override
  void giveUpMatch(BuildContext context) {
    Provider.of<GameProvider>(context, listen: false).reset();
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }

  @override
  void toRespond(BuildContext context, TextEditingController _controller) {
    if (response.isNotEmpty) {
      final gameProvider = context.read<GameProvider>();
      gameProvider.respond(response, context);
      _controller.clear();
      response = "";
    } else {
      final snackBar = SnackBar(
        duration: Duration(seconds: 1),
        content: SizedBox(
            height: 75,
            child: Text('A resposta não poder estar Vazia...')),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

    }
  }


  @override
  void buyTip(BuildContext context) {
    final gameProvider = context.read<GameProvider>();
    if (gameProvider.totalAmount >= 500.0) {
      gameProvider.spendPoints(500.0);
      gameProvider.addTips();
      // Lógica para adicionar pista
    }
  }

  @override
  void initNewGame(BuildContext context) {
    final gameProvider = context.read<GameProvider>();
    try{
      gameProvider.reset();
      gameProvider.iniciarNovoJogo();
      gameProvider.addTips();
    }catch(e){
      print(e.toString());
    }

  }

  @override
  void leaveTheGame(BuildContext context){
    final gameProvider = context.read<GameProvider>();
    gameProvider.reset();

    //Provider.of<GameProvider>(context, listen: false).reset(); // Crie um método reset no seu GameProvider
    Navigator.popUntil(context, ModalRoute.withName('/')); // Certifique-se de que 'Tela_inicial' seja a rota nomeada da tela inicial
  }
}


