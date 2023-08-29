import 'package:flutter/material.dart';
import 'package:projetct_quiz_god/src/ui/util/color/Style_guide.dart';

class ButtonToGetTips extends StatelessWidget {

  final String title;
  final Color buttonColor;
  final Color borderColor;
  final Color shadowColor;
  final VoidCallback onAction;


  const ButtonToGetTips({Key?
  key,
    required this.title,
    required this.buttonColor,
    required this.borderColor,
    required this.shadowColor,
    required this.onAction
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: EdgeInsetsDirectional.symmetric(horizontal: 25),
      decoration: BoxDecoration(
          border: Border.all(
              color: borderColor,
              width: 5
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
                color: Colors.black,
                offset: Offset(5.0, -5.0),
                spreadRadius: 2.0
            )
          ]
      ),
      child: ElevatedButton(
        onPressed: () {
          onAction.call();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            elevation: 0
        ),

        child: Text(
          title,
          style: TextStyle(
            color: shadowColor,
            fontFamily: 'Alphakind',
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
      ),
    );
  }
}
