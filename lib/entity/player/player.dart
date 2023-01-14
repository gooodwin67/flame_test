import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flame/widgets.dart';

class DinoPlayer extends SpriteAnimationComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    //await _loadAnimations().then((_) => {animation: _walkingAnimation});

    size = Vector2(100, 100);

    var spriteAnimationRun = SpriteAnimationData.sequenced(
      amount: 8,
      stepTime: 0.1,
      textureSize: Vector2(379, 446),
    );

    var spriteAnimationStay = SpriteAnimationData.sequenced(
      amount: 10,
      stepTime: 0.1,
      textureSize: Vector2(307, 321),
    );

    animation =
        await gameRef.loadSpriteAnimation('dino-run3.png', spriteAnimationRun);
    anchor = Anchor.center;
  }
}

class MyCamera extends PositionComponent with HasGameRef {
  MyCamera({Vector2? position}) : super();

  @override
  Future<void> onLoad() async {
    super.onLoad();

    size:
    Vector2(gameRef.size.x, gameRef.size.y);
    position:
    Vector2(gameRef.size.x / 2, gameRef.size.y / 2);
  }
}
