import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:project_game_fruit/game/components/basket.dart';

enum FruitType { manggo, banana, coconut, orange }

class Fruit extends PositionComponent with HasGameRef<FruitCatcherGame>, CollisionCallbacks {
  final FruitType type;
  final double fallSpeed = 200;
  final Random random = Random();

  Fruit({super.position})
    : type = FruitType.values[Random().nextInt(FruitType.values.length)],
      super(size: Vector2.all(40));

      @override
      Future<void> onLoad() async {
        await super.onLoad();
        anchor = Anchor.center;
        add(CircleHitbox());
      }

      @override
      void update(double dt) {
        super.update(dt);

        position.y += fallSpeed * dt;

        if (position.y > gameRef.size.y + 50) {
          removeFromParent();
        }
      }

      @override
      void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
        super.onCollision(intersectionPoints, other);

        if (other is Basket) {
          gameRef.incrementScore();
          removeFromParent();
        }
      }
}