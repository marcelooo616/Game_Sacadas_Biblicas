import 'package:flutter/cupertino.dart';

abstract class GameActions{
  void giveUpMatch(BuildContext context);
  void toRespond(BuildContext context, TextEditingController _controller);
  void buyTip(BuildContext context);
  void initNewGame(BuildContext context);
  void leaveTheGame(BuildContext context);
}