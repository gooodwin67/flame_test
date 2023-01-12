import 'package:flame/components.dart';

class Animations extends SpriteAnimationComponent with HasGameRef {
  var spriteAnimationRun = SpriteAnimationData.sequenced(
    amount: 8,
    stepTime: 0.1,
    textureSize: Vector2(379, 381),
  );

  var spriteAnimationStay = SpriteAnimationData.sequenced(
    amount: 10,
    stepTime: 0.1,
    textureSize: Vector2(307, 321),
  );
}
