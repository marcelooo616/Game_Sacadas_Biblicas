import 'package:flutter/material.dart';
import 'package:projetct_quiz_god/src/models/providers/game_provider.dart';
import 'package:projetct_quiz_god/src/models/services/impl/GameActionsServiceImpl.dart';
import 'package:projetct_quiz_god/src/ui/pages/page_start_game.dart';
import 'package:projetct_quiz_god/src/ui/pages/tela_inicial.dart';
import 'package:projetct_quiz_god/src/ui/util/color/Style_guide.dart';
import 'package:projetct_quiz_god/src/ui/widgets/FloatingButton.dart';
import 'package:provider/provider.dart';

class DefeatPage extends StatelessWidget {
  const DefeatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final gameActions = GameActionsServiceImpl();

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/defeat.jpg'),
                      fit: BoxFit.cover
                  )
              ),
              child: Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                ),
                child: Image.asset("assets/images/de.png"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsetsDirectional.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Style_guide.color_primary,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(5.0, -5.0),
                            spreadRadius: 2.0
                        )
                      ]
                  ),
                  child: Text("Defeat",
                    style: TextStyle(
                      fontSize: 25,
                      color: Style_guide.color_secundary,
                      fontFamily: 'Alphakind',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            Container(
                padding: EdgeInsets.only(top: 40),
                child: FloatingButton(text: "New Game", isAnimationOnOff: true, callback: () => gameActions.initNewGame(context),navigateToNextScreen: StartGame(),)),
            Container(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: FloatingButton(text: "Exit", isAnimationOnOff: true, callback: () => gameActions.leaveTheGame(context), navigateToNextScreen: Tela_inicial(),))
          ],
        ),
      ),
    );
  }
}
