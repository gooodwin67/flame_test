import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'package:flame/sprite.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';

class DinoPlayer extends SpriteAnimationComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    super.onLoad();

    size = Vector2(100, 100);
    anchor = Anchor.center;

    add(RectangleCollidable(Vector2(0, 10)));
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

class RectangleCollidable extends PositionComponent with CollisionCallbacks {
  final _collisionStartColor = Colors.amber;
  final _defaultColor = Color.fromARGB(255, 29, 177, 49);
  late ShapeHitbox hitbox;

  RectangleCollidable(Vector2 position)
      : super(
          position: position,
          size: Vector2(100, 80),
          anchor: Anchor.topLeft,
        );

  @override
  Future<void> onLoad() async {
    final defaultPaint = Paint();
    defaultPaint.color = _defaultColor;
    defaultPaint.style = PaintingStyle.stroke;
    defaultPaint.strokeCap = StrokeCap.round;
    defaultPaint.strokeWidth = 3;

    hitbox = RectangleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitbox);
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    hitbox.paint.color = _collisionStartColor;
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    if (!isColliding) {
      hitbox.paint.color = _defaultColor;
    }
  }
}
