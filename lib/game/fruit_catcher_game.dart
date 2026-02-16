import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:project_game_fruit/game/components/basket.dart';
import 'package:project_game_fruit/game/managers/audio_manager.dart';

class FruitCatcherGame extends FlameGame with PanDetector, HasCollisionDetection {
    late Basket basket;
    late TextComponent scoreText;
    final Random random = Random();
    double fruitSpawnInterval = 1.5;

  final ValueNotifier<int> scoreNotifier = ValueNotifier<int>(0);
    int _score = 0;

    int get score => _score;
    set score(int value) {
      _score = value;
      scoreNotifier.value = value;
    }
  

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    AudioManager().playBackgroundMusic();
  }
}
