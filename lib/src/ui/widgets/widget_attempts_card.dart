import 'package:flutter/material.dart';
import 'package:projetct_quiz_god/src/ui/util/color/Style_guide.dart';


class AttempstCard extends StatelessWidget {

  final String item;
  const AttempstCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), // Bordas circulares
          color: Style_guide.color_pink, // Cor de fundo
          boxShadow: const [
            BoxShadow(
                color: Style_guide.color_primary,
                offset: Offset(5.0, -5.0),
                spreadRadius: 2.0
            )
          ]
      ),
      child: Center(
        child: Text(
          item, // Texto da tentativa
          style: TextStyle(fontSize: 16.0,color: Style_guide.color_secundary),
        ),
      ),
    );
  }
}
