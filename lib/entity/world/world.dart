import 'package:flame/components.dart';

class DinoWorld extends SpriteComponent with HasGameRef {
  double sizeWorldY = 0;
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('background.jpg');
    size = Vector2(sprite!.originalSize.x, gameRef.size.y);
    position.x = -gameRef.size.x;
    sizeWorldY = gameRef.size.y;
  }
}

class DinoWorld2 extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('background.jpg');
    size = Vector2(sprite!.originalSize.x, gameRef.size.y);
    position.x = size.x - gameRef.size.x + 10;
  }
}
