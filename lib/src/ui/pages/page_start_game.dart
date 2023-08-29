import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projetct_quiz_god/src/models/providers/game_provider.dart';
import 'package:projetct_quiz_god/src/models/services/impl/GameActionsServiceImpl.dart';
import 'package:projetct_quiz_god/src/ui/pages/page_defeat.dart';
import 'package:projetct_quiz_god/src/ui/pages/tela_inicial.dart';
import 'package:projetct_quiz_god/src/ui/util/color/Style_guide.dart';
import 'package:projetct_quiz_god/src/ui/widgets/FloatingButton.dart';
import 'package:projetct_quiz_god/src/ui/widgets/widget_attempts_card.dart';
import 'package:projetct_quiz_god/src/ui/widgets/widget_button_to_get_tips.dart';
import 'package:projetct_quiz_god/src/ui/widgets/widget_life_bar.dart';
import 'package:projetct_quiz_god/src/ui/widgets/widget_reply_buttons.dart';
import 'package:provider/provider.dart';

class StartGame extends StatefulWidget {
  const StartGame({Key? key}) : super(key: key);

  @override
  State<StartGame> createState() => _StartGameState();
}

class _StartGameState extends State<StartGame> {
  TextEditingController _controller = TextEditingController();
  final gameAction = GameActionsServiceImpl();

  String resposta = "";

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);

    if (gameProvider.totalAmount == 0) {
      Future.delayed(Duration.zero, () {
        Navigator.push(context,
            MaterialPageRoute(builder:  (context) => DefeatPage() ));
      });



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
        child: ListView(
          children: [
            /*
            * Barra de vida e pontos
            * */
            LifeBarAndPoints(),
            /*
            * Carousel de dicas
            * */
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: CarouselSlider(
                items: gameProvider.pistasCompradas.reversed
                    .map((element) =>
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Style_guide.color_pink,
                        border: Border.all(
                            width: 5,
                            color: Style_guide.color_primary,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          element,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Style_guide.color_secundary,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ))
                    .toList(),
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: 2,
                  autoPlay: false,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (index, reason) {
                    // Ação a ser executada quando a página é alterada
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),

            /*
            * Button de compra dicas
            * */
            ButtonToGetTips(
                title: "Compra Dicas (500)",
                buttonColor: Style_guide.background,
                borderColor: Style_guide.color_secundary,
                shadowColor: Style_guide.color_primary,
                onAction: () => gameAction.buyTip(context)),
            /*
            * Input TextFiel
            * */
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Style_guide.color_primary,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 10, color: Style_guide.color_secundary),
                ),
                child: TextField(
                  controller: _controller,
                  onChanged: (value) {
                    if(value.trim().isNotEmpty){
                      setState(() {
                        gameAction.response = value;
                      });
                    }

                  },
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Style_guide.color_secundary,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Style_guide.color_primary,
                  ),
                ),
              ),
            ),
            /*
            * Grid de tentativas
            */
            Container(
              height: 200,
              padding: EdgeInsetsDirectional.symmetric(horizontal: 15),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, // Define o número de colunas no grid
                  crossAxisSpacing: 10.0, // Espaçamento horizontal entre os itens
                  mainAxisSpacing: 10.0, // Espaçamento vertical entre os itens
                ),
                itemCount: gameProvider.tentativas.length, // Número total de itens
                itemBuilder: (BuildContext context, int index) {
                  return AttempstCard(item: gameProvider.tentativas[index]);
                },
              ),
            ),
            /*
            * Row buttons
            * */


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReplyButtons(
                      buttonColor: Style_guide.color_green,
                      shadowColor: Style_guide.color_primary,
                      onAction: () => gameAction.toRespond(context, _controller),
                      buttonTitle: "Responder"),
                  ReplyButtons(
                      buttonColor: Style_guide.color_pink,
                      shadowColor: Style_guide.color_primary,
                      onAction: () => gameAction.giveUpMatch(context),
                      buttonTitle: "Desistir"),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
