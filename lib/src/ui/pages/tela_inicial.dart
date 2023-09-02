import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lifecycle/lifecycle.dart';
import 'package:projetct_quiz_god/src/models/providers/game_provider.dart';
import 'package:projetct_quiz_god/src/models/services/impl/AmbientMusicServiceImpl.dart';
import 'package:projetct_quiz_god/src/ui/util/color/Style_guide.dart';
import 'package:projetct_quiz_god/src/ui/pages/page_settings.dart';
import 'package:projetct_quiz_god/src/ui/pages/page_start_game.dart';
import 'package:projetct_quiz_god/src/ui/widgets/FloatingButton.dart';
import 'package:projetct_quiz_god/src/ui/widgets/button_commun.dart';
import 'package:projetct_quiz_god/src/ui/widgets/widget_logo.dart';
import 'package:provider/provider.dart';

class Tela_inicial extends StatefulWidget  {
  const Tela_inicial({Key? key}) : super(key: key);

  @override
  State<Tela_inicial> createState() => _Tela_inicialState();
}

class _Tela_inicialState extends State<Tela_inicial> with WidgetsBindingObserver{
  final audioService = AmbientMusicaServiceImpl();
  AudioPlayer? player;
  bool isBackground = false;


  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    audioService.runAudio("d.mp3");
    super.initState();
  }

  @override
  void dispose() {
  WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      isBackground = (state != AppLifecycleState.resumed);
      isBackground ? audioService.stopAudio() : audioService.resumeAudio();

    });
  }

  @override
  Widget build(BuildContext context) {
  final gameProvider = Provider.of<GameProvider>(context);

     initNewGame(){
      print("Iniicnado new GAme");
      gameProvider.iniciarNovoJogo();
      gameProvider.addTips();
    }


    return Scaffold(
      backgroundColor: Style_guide.background,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg3.png'),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 75, horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button_commun(icon_button: Icons.settings, screen: PageSettings(), functionBackTo: false),
                  Button_commun(icon_button: Icons.quiz_outlined, functionBackTo: false,),
                ],
              ),
              Container(
                height: 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Logo(),
                    FloatingButton(text: "Start Game", isAnimationOnOff: true, callback: () => initNewGame(),navigateToNextScreen: StartGame(), ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
