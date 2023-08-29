import 'package:flutter/material.dart';
import 'package:projetct_quiz_god/src/ui/util/color/Style_guide.dart';

class ReplyButtons extends StatelessWidget {

  final Color shadowColor;
  final Color buttonColor;
  final String buttonTitle;
  final VoidCallback onAction;



  const ReplyButtons({Key?
  key,
    required this.buttonColor,
    required this.shadowColor,
    required this.onAction,
    required this.buttonTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          minWidth: 150,
          minHeight: 75
      ),
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow:  [
            BoxShadow(
                offset: Offset(5.0, -5.0),
                color: shadowColor,
                spreadRadius: 2.0
            )
          ]
      ),
      child: ElevatedButton(
          onPressed: (){
            onAction.call();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0
          ),
          child: Text(buttonTitle, style: TextStyle(fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.bold))
      ),
    );
  }
}
