import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flame/widgets.dart';

class DinoPlayer extends SpriteAnimationComponent with HasGameRef {
  late final SpriteAnimation _walkingAnimation;
  final double _animationSpeed = .15;

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet.fromColumnsAndRows(
      image: await gameRef.images.load('dino-sprite.png'),
      columns: 10,
      rows: 1,
    );

    //print();

    _walkingAnimation = spriteSheet.createAnimation(
        row: 0, stepTime: _animationSpeed, from: 0, to: 9);
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await _loadAnimations().then((_) => {animation: _walkingAnimation});
  }
}

class MyCamera extends SpriteComponent with HasGameRef {
  MyCamera() : super(size: Vector2.all(1.0));

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('dino.png');
    position = Vector2(170, gameRef.size.y / 2);
  }
}
