import 'package:flutter/material.dart';
import 'package:project_game_fruit/game/fruit_catcher_game.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Catcher Game',
      home: const GameScreen()
    );
  }
}