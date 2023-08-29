import 'package:flutter/material.dart';
import 'package:projetct_quiz_god/src/ui/util/color/Style_guide.dart';

final customSnackBarTheme = SnackBarThemeData(

  contentTextStyle: TextStyle(
      fontSize: 25,
      color: Style_guide.color_primary,
      fontFamily: 'Alphakind',
      fontWeight: FontWeight.bold
  ), // Ajuste o tamanho da fonte conforme necessário
  behavior: SnackBarBehavior.fixed,
  backgroundColor: Style_guide.background,// Isso força a altura fixa
  shape: RoundedRectangleBorder(
    side: BorderSide(color: Style_guide.color_primary, width: 6),
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(10), // Ajuste o raio conforme necessário
    ),
  ),
);
