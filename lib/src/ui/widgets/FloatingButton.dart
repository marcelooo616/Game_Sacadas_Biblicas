import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:projetct_quiz_god/src/models/providers/game_provider.dart';
import 'package:projetct_quiz_god/src/ui/util/color/Style_guide.dart';
import 'package:projetct_quiz_god/src/ui/pages/page_start_game.dart';
import 'package:provider/provider.dart';


class FloatingButton extends StatefulWidget {
  final String? text;
  final bool? isAnimationOnOff;
  final VoidCallback? callback;
  final Widget? navigateToNextScreen;



  FloatingButton({required this.text, required this.isAnimationOnOff, this.callback, this.navigateToNextScreen});

  @override
  _FloatingButtonState createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  late double offSetEnd = -0.2;




  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, widget.isAnimationOnOff! ? offSetEnd : 0.0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return SlideTransition(
      position: _animation,
      child: Container(
        decoration: BoxDecoration(
            color: Style_guide.background,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(5.0, 2.0),
                  spreadRadius: 7.0
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 7, bottom: 19, left: 32, right: 21),
          child: ElevatedButton(
            onPressed: () {
              widget.callback?.call();
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => widget.navigateToNextScreen!)
              );

            },
            style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation: 0
            ),

            child: Text(widget.text!,
              style: TextStyle(color: Style_guide.color_primary, fontSize: 25, fontFamily: 'Alphakind' , fontWeight: FontWeight.bold),
            ),

          ),
        ),
      ),
    );
  }
}