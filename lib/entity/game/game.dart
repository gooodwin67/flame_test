import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_test/entity/player/player.dart';
import 'package:flame_test/entity/world/world.dart';
import 'package:flutter/material.dart';

class DinoGame extends FlameGame with HasGameRef {
  final DinoPlayer _dinoPlayer = DinoPlayer();
  final MyCamera _camera = MyCamera();
  final Sky _sky = Sky();
  final DinoHugeClouds _dinoHugeClouds = DinoHugeClouds();
  final DinoHugeClouds _dinoHugeClouds2 = DinoHugeClouds();

  final DinoClouds _dinoClouds = DinoClouds();
  final DinoClouds _dinoCloudsA = DinoClouds();

  final DinoClouds2 _dinoClouds2 = DinoClouds2();
  final DinoClouds2 _dinoClouds2A = DinoClouds2();

  final DinoClouds3 _dinoClouds3 = DinoClouds3();
  final DinoClouds3 _dinoClouds3A = DinoClouds3();

  final DinoHill _dinoHill = DinoHill();
  final DinoHill _dinoHill2 = DinoHill();

  final DinoHill _dinoHillA = DinoHill();
  final DinoHill _dinoHill2A = DinoHill();

  final DinoBushes _dinoBushes = DinoBushes();
  final DinoBushes _dinoBushes2 = DinoBushes();

  final DinoManyTrees _dinoManyTrees = DinoManyTrees();
  final DinoManyTrees _dinoManyTrees2 = DinoManyTrees();

  final DinoTrees _dinoTrees = DinoTrees();
  final DinoTrees _dinoTrees2 = DinoTrees();

  final DinoGround _dinoGround = DinoGround();
  final DinoGround _dinoGround2 = DinoGround();

  @override
  Future<void> onLoad() async {
    super.onLoad();

    await add(_sky);
    await add(_dinoHugeClouds);
    await add(_dinoHugeClouds2);
    await add(_dinoClouds);
    await add(_dinoCloudsA);
    await add(_dinoClouds2);
    await add(_dinoClouds2A);
    await add(_dinoClouds3);
    await add(_dinoClouds3A);
    await add(_dinoHill);
    await add(_dinoHill2);
    await add(_dinoBushes);
    await add(_dinoBushes2);
    await add(_dinoManyTrees);
    await add(_dinoManyTrees2);
    await add(_dinoTrees);
    await add(_dinoTrees2);
    await add(_dinoGround);
    await add(_dinoGround2);
    await add(_dinoPlayer);
    await add(_camera);

    _dinoPlayer.position.y = _dinoGround.sizeWorldY * 0.80;

    camera.followComponent(_camera);
  }

  reBackground(player, world, world2) {
    if (player.position.x > world.position.x &&
        player.position.x > world.position.x + player.size.x) {
      world2.position.x = world.position.x + world.size.x;
    }
    if (player.position.x > world2.position.x &&
        player.position.x > world2.position.x + player.size.x) {
      world.position.x = world2.position.x + world2.size.x;
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    _camera.position.x += 6;
    _dinoPlayer.position.x =
        _camera.position.x - gameRef.size.x / 2 + _dinoPlayer.size.x / 0.9;
    _sky.position.x = _camera.position.x - _sky.size.x / 2;
    _dinoTrees.position.x += 2;
    _dinoTrees2.position.x += 2;
    _dinoManyTrees.position.x += 4;
    _dinoManyTrees2.position.x += 4;
    _dinoBushes.position.x += 5;
    _dinoBushes2.position.x += 5;
    _dinoClouds.position.x += 5.5;
    _dinoCloudsA.position.x += 5.5;
    _dinoClouds2.position.x += 5.7;
    _dinoClouds2A.position.x += 5.7;
    _dinoClouds3.position.x += 5.8;
    _dinoClouds3A.position.x += 5.8;
    _dinoHill.position.x += 5.8;
    _dinoHill2.position.x += 5.8;
    _dinoHugeClouds.position.x += 5.9;
    _dinoHugeClouds2.position.x += 5.9;
    // print('111');
    // print('${_camera.position} ------ ${_dinoPlayer.size}');

    reBackground(_dinoPlayer, _dinoGround, _dinoGround2);
    reBackground(_dinoPlayer, _dinoTrees, _dinoTrees2);
    reBackground(_dinoPlayer, _dinoManyTrees, _dinoManyTrees2);
    reBackground(_dinoPlayer, _dinoBushes, _dinoBushes2);
    reBackground(_dinoPlayer, _dinoClouds, _dinoCloudsA);
    reBackground(_dinoPlayer, _dinoClouds2, _dinoClouds2A);
    reBackground(_dinoPlayer, _dinoClouds3, _dinoClouds3A);
    reBackground(_dinoPlayer, _dinoHill, _dinoHill2);
    reBackground(_dinoPlayer, _dinoHugeClouds, _dinoHugeClouds2);
  }
}
