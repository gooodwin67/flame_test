import 'package:flame/components.dart';
import 'package:flame/game.dart';

import 'package:flutter/material.dart';

void main() {
  final game = DinoGame();
  runApp(
    GameWidget(
      game: game,
    ),
  );
}

class DinoWorld extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('background.jpg');
    size = Vector2(sprite!.originalSize.x, gameRef.size.y);
    position.x = -gameRef.size.x;
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

class DinoPlayer extends SpriteComponent with HasGameRef {
  DinoPlayer() : super(size: Vector2.all(100.0));

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('dino.png');
    position = Vector2(10, 417);
  }

  @override
  void update(double dt) {
    super.update(dt);
    updatePosition(dt);
  }

  updatePosition(dt) {
    position.x += 6;
  }
}

class Camera extends SpriteComponent with HasGameRef {
  Camera() : super(size: Vector2.all(1.0));

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('dino.png');
    position = Vector2(170, gameRef.size.y / 2);
  }

  @override
  void update(double dt) {
    super.update(dt);
    updatePosition(dt);
  }

  updatePosition(dt) {
    position.x += 6;
  }
}

class DinoGame extends FlameGame {
  DinoPlayer _dinoPlayer = DinoPlayer();
  Camera _camera = Camera();
  DinoWorld _dinoWorld = DinoWorld();
  DinoWorld2 _dinoWorld2 = DinoWorld2();

  @override
  Future<void> onLoad() async {
    super.onLoad();

    await add(_dinoWorld);
    await add(_dinoWorld2);
    await add(_dinoPlayer);
    await add(_camera);

    //_worldPositionX = _dinoWorld.position.x;

    camera.followComponent(_camera);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (_dinoPlayer.position.x > _dinoWorld.position.x &&
        _dinoPlayer.position.x > _dinoWorld.position.x + 500) {
      _dinoWorld2.position.x = _dinoWorld.position.x + _dinoWorld.size.x;
    }
    if (_dinoPlayer.position.x > _dinoWorld2.position.x &&
        _dinoPlayer.position.x > _dinoWorld2.position.x + 500) {
      _dinoWorld.position.x = _dinoWorld2.position.x + _dinoWorld2.size.x;
    }
  }
}
