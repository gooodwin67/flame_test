import 'package:flame/components.dart';

class DinoGround extends SpriteComponent with HasGameRef {
  double sizeWorldY = 0;
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('ground.png');
    size = Vector2(sprite!.originalSize.x, gameRef.size.y);
    position.x = -gameRef.size.x;
    sizeWorldY = gameRef.size.y;
  }
}

class DinoTrees extends SpriteComponent with HasGameRef {
  double sizeWorldY = 0;
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('trees.png');
    size = Vector2(sprite!.originalSize.x, gameRef.size.y);
    position.x = -gameRef.size.x;
    sizeWorldY = gameRef.size.y;
  }
}

class DinoManyTrees extends SpriteComponent with HasGameRef {
  double sizeWorldY = 0;
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('trees2.png');
    size = Vector2(sprite!.originalSize.x, gameRef.size.y);
    position.x = -gameRef.size.x;
    sizeWorldY = gameRef.size.y;
  }
}

class DinoBushes extends SpriteComponent with HasGameRef {
  double sizeWorldY = 0;
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('bushes.png');
    size = Vector2(sprite!.originalSize.x, gameRef.size.y);
    position.x = -gameRef.size.x;
    sizeWorldY = gameRef.size.y;
  }
}

class DinoHill extends SpriteComponent with HasGameRef {
  double sizeWorldY = 0;
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('hill2.png');
    size = Vector2(sprite!.originalSize.x, gameRef.size.y);
    position.x = -gameRef.size.x;
    sizeWorldY = gameRef.size.y;
  }
}

class DinoClouds extends SpriteComponent with HasGameRef {
  double sizeWorldY = 0;
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('clouds.png');
    size = Vector2(sprite!.originalSize.x, gameRef.size.y);
    position.x = -gameRef.size.x;
    sizeWorldY = gameRef.size.y;
  }
}

class DinoClouds2 extends SpriteComponent with HasGameRef {
  double sizeWorldY = 0;
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('clouds2.png');
    size = Vector2(sprite!.originalSize.x, gameRef.size.y);
    position.x = -gameRef.size.x;
    sizeWorldY = gameRef.size.y;
  }
}

class DinoClouds3 extends SpriteComponent with HasGameRef {
  double sizeWorldY = 0;
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('clouds3.png');
    size = Vector2(sprite!.originalSize.x, gameRef.size.y);
    position.x = -gameRef.size.x;
    sizeWorldY = gameRef.size.y;
  }
}

class DinoHugeClouds extends SpriteComponent with HasGameRef {
  double sizeWorldY = 0;
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('huge_clouds.png');
    size = Vector2(sprite!.originalSize.x, gameRef.size.y);
    position.x = -gameRef.size.x;
    sizeWorldY = gameRef.size.y;
  }
}

class Sky extends SpriteComponent with HasGameRef {
  double sizeWorldY = 0;
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('sky.png');
    size = Vector2(sprite!.originalSize.x, gameRef.size.y);
    position.x = -gameRef.size.x;
    sizeWorldY = gameRef.size.y;
  }
}
