import 'package:flutter/material.dart';
import 'package:projetct_quiz_god/src/models/services/impl/GameActionsServiceImpl.dart';
import 'package:projetct_quiz_god/src/ui/util/color/Style_guide.dart';
import 'package:projetct_quiz_god/src/ui/pages/page_start_game.dart';
import 'package:projetct_quiz_god/src/ui/widgets/FloatingButton.dart';
import 'package:projetct_quiz_god/src/ui/widgets/button_commun.dart';

class PageSettings extends StatelessWidget {
  const PageSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameActions = GameActionsServiceImpl();
    
    return Scaffold(
      backgroundColor: Style_guide.background,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 75, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button_commun(icon_button: Icons.arrow_back_ios_new,functionBackTo: true),
              ],
            ),
            Container(
              height: 250,
              decoration: BoxDecoration(

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingButton(text: "Music", isAnimationOnOff: false,),
                      Container(
                        decoration: BoxDecoration(

                        ),
                        child: Icon(
                          Icons.toggle_off,
                          size: 80,
                          color: Colors.black,
                          shadows: [
                            BoxShadow(
                                color: Style_guide.color_red,
                                offset: Offset(5.0, 2.0),
                                spreadRadius: 5.0

                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingButton(text: "Sound", isAnimationOnOff: false,),
                      Container(
                        child: Icon(
                          Icons.toggle_on,
                          size: 80,
                          color: Colors.black,
                          shadows: [
                            BoxShadow(
                                color: Style_guide.color_green,
                                offset: Offset(5.0, 2.0),
                                spreadRadius: 5.0

                            )
                          ],
                        ),
                      )
                    ],
                  ),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingButton(text: "Star Game", isAnimationOnOff: true,navigateToNextScreen: StartGame(), callback:() => gameActions.initNewGame(context), ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
