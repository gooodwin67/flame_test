import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_test/entity/player/player.dart';
import 'package:flame_test/entity/world/world.dart';
import 'package:flutter/material.dart';

class DinoGame extends FlameGame {
  DinoPlayer _dinoPlayer = DinoPlayer();
  MyCamera _camera = MyCamera();
  DinoWorld _dinoWorld = DinoWorld();
  DinoWorld2 _dinoWorld2 = DinoWorld2();

  @override
  Future<void> onLoad() async {
    super.onLoad();

    await add(_dinoWorld);
    await add(_dinoWorld2);
    await add(_dinoPlayer);
    await add(_camera);

    _dinoPlayer.position.x = 60;
    _dinoPlayer.position.y = _dinoWorld.sizeWorldY * 0.78;

    camera.followComponent(_camera);
  }

  @override
  void update(double dt) {
    super.update(dt);

    _camera.position.x += 5;
    _dinoPlayer.position.x += 5;
    // print('111');
    // print('${_camera.position} ------ ${_dinoPlayer.size}');

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
