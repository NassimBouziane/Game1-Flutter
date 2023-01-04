import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'game.dart';
import 'helpers/navigation_keys.dart';
void main(List<String> args) {
  final game = GameTest();
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false,
    home: Scaffold(body: Stack(children: [GameWidget(game: game),
    Align(
      alignment: Alignment.bottomLeft,
      child: NavigationKeys(onDirectionChanged: game.onArrowKeyChanged,),
    )],),))

    
  );
}
