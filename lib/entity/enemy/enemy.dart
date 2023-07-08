import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';

class Enemy1 extends SpriteAnimationComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    super.onLoad();

    size = Vector2(100, 80);
    position = Vector2(gameRef.size.x + gameRef.size.x / 2, 0);
    anchor = Anchor.center;
    add(RectangleCollidable(Vector2(20, 35)));
  }
}

class Enemy2 extends SpriteAnimationComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    super.onLoad();

    size = Vector2(100, 80);
    position = Vector2(0 - gameRef.size.x * 3, 0);
    anchor = Anchor.center;
    add(RectangleCollidable(Vector2(0, 30)));
  }
}

class RectangleCollidable extends PositionComponent with CollisionCallbacks {
  final _collisionStartColor = Colors.transparent;
  final _defaultColor = Colors.transparent;
  late ShapeHitbox hitbox;

  RectangleCollidable(Vector2 position)
      : super(
          position: position,
          size: Vector2(70, 40),
          anchor: Anchor.topLeft,
        );

  @override
  Future<void> onLoad() async {
    final defaultPaint = Paint();
    defaultPaint.color = _defaultColor;
    defaultPaint.style = PaintingStyle.stroke;
    defaultPaint.strokeCap = StrokeCap.round;
    defaultPaint.strokeWidth = 0;

    hitbox = RectangleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitbox);
  }
}
