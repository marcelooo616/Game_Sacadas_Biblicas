import 'package:flutter/material.dart';
import 'package:projetct_quiz_god/src/models/providers/game_jornada_provider.dart';
import 'package:projetct_quiz_god/src/models/providers/game_provider.dart';
import 'package:projetct_quiz_god/src/ui/pages/tela_inicial.dart';
import 'package:projetct_quiz_god/src/ui/util/theme/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => GameProvider()),
      ChangeNotifierProvider(create: (context) => GameJornadaProvider()),
    ],
    child: MyApp(),
  ));

}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        snackBarTheme: customSnackBarTheme,
        primarySwatch: Colors.blue,
      ),
      home: Tela_inicial(),
    );
  }
}

