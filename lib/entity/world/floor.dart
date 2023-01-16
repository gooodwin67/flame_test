import 'package:flame/components.dart';

class DinoFloor extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('floor.jpg');
    size = Vector2(gameRef.size.x, 0);
  }
}
