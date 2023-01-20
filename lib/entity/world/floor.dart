import 'package:flame/components.dart';

class DinoFloor extends PositionComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    super.onLoad();

    size = Vector2(gameRef.size.x, 0);
  }
}
