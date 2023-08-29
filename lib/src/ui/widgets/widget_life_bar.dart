import 'package:flutter/material.dart';
import 'package:projetct_quiz_god/src/models/providers/game_provider.dart';
import 'package:projetct_quiz_god/src/ui/util/color/Style_guide.dart';
import 'package:provider/provider.dart';

class LifeBarAndPoints extends StatelessWidget {
  const LifeBarAndPoints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 35, left: 15, right: 15),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            color: Style_guide.background,
            border: Border.all(width: 8, color: Style_guide.color_primary),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //vidas
            Container(
              width: 120,
              decoration: BoxDecoration(

              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: gameProvider.lifeIcons.map((item) {
                    return Icon(
                      color: Style_guide.color_primary,
                      item,
                      size: 35,
                    );
                  }).toList()
              ),
            ),
            //saldo da conta
            Container(
              child: Text(
                gameProvider.totalAmount.toString(),

                style: TextStyle(
                    fontFamily: 'Alphakind',
                    color:  Style_guide.color_primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
