import 'package:flutter/material.dart';
import 'package:projetct_quiz_god/src/ui/util/color/Style_guide.dart';

class Button_commun extends StatelessWidget {

  final IconData? icon_button;
  final Widget? screen;
  final bool? functionBackTo;

  const Button_commun({
    required this.icon_button,
    this.screen,
    required this.functionBackTo
  });


  void _navigateToScreen(BuildContext context){
    functionBackTo!
        ? Navigator.pop(context)
        : Navigator.push(context, MaterialPageRoute(builder: (context) => screen!));
  }

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: (){
        _navigateToScreen(context);
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Style_guide.color_primary,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(5.0, 2.0),
                  spreadRadius: 2.0
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(
              icon_button == null ? Icons.abc : icon_button,
              size: 25,
              color: Style_guide.color_secundary
          ),
        ),
      ),
    );
  }
}
