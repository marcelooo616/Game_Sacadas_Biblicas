import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projetct_quiz_god/src/models/providers/game_provider.dart';
import 'package:projetct_quiz_god/src/ui/util/color/Style_guide.dart';
import 'package:provider/provider.dart';


class TipsCarousel extends StatelessWidget {

  //final Color carouselColor;
  //final Color borderColor;
  //final List<String> tips;

  const TipsCarousel({Key?
  key,
    //required this.carouselColor,
    //required this.borderColor,
    //required this.tips
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: CarouselSlider(
          items: gameProvider.tentativas.reversed
              .map<Widget>((element) =>
              Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Style_guide.color_pink,
                    border: Border.all(width: 5, color: Style_guide.color_primary,style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      element,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Style_guide.color_secundary, fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 17,),
                    ),
                  )
              )).toList(),
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
          )),
    );
  }
}
