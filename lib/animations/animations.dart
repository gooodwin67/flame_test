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

  var spriteAnimationJump = SpriteAnimationData.sequenced(
    amount: 11,
    stepTime: 0.15,
    textureSize: Vector2(379, 410),
  );

  var spriteAnimationDown = SpriteAnimationData.sequenced(
    amount: 8,
    stepTime: 0.1,
    textureSize: Vector2(384, 293),
  );

  var enemySpriteAnimationRun = SpriteAnimationData.sequenced(
    amount: 11,
    stepTime: 0.1,
    textureSize: Vector2(454, 318),
  );

  var enemySpriteAnimationAttack = SpriteAnimationData.sequenced(
    amount: 7,
    stepTime: 0.12,
    textureSize: Vector2(454, 318),
  );

  var enemy2SpriteAnimationFly = SpriteAnimationData.sequenced(
    amount: 4,
    stepTime: 0.1,
    textureSize: Vector2(400, 318),
  );
}
