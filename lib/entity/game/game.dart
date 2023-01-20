import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';

import 'package:flame_test/animations/animations.dart';
import 'package:flame_test/entity/enemy/enemy.dart';
import 'package:flame_test/entity/player/player.dart';
import 'package:flame_test/entity/world/floor.dart';
import 'package:flame_test/entity/world/world.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum GameState { intro, playing }

double gravity = 1;
double enemy1Gravity = 1;
double enemy2Gravity = 1;
double speed = 0;
double maxSpeed = 1;
bool isJumping = false;
bool canTapJump = true;
double jumpSpeed = 1;
int jumpHeight = 100;
bool playerDown = false;
bool enemy1Walk = true;
List enemys = [];
int score = 0;
int bestScore = 0;

class DinoGame extends FlameGame
    with HasGameRef, TapDetector, HasCollisionDetection {
  DinoGame({super.children});
  final DinoPlayer _dinoPlayer = DinoPlayer();
  final DinoFloor _dinoFloor = DinoFloor();
  final MyCamera _camera = MyCamera();
  final Enemy1 _enemy1 = Enemy1();
  final Enemy2 _enemy2 = Enemy2();
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

  final scoreStyle = TextPaint(
      style: TextStyle(
    color: Color.fromARGB(255, 31, 31, 31),
    fontSize: 20,
  ));
  TextComponent scoreText = TextComponent(
      text: 'Score: ${score.toString()}', position: Vector2(0, 80));
  TextComponent bestScoreText = TextComponent(
      text: 'Best score: ${bestScore.toString()}', position: Vector2(0, 40));

  ////////////////////////////////////////////////////////////

  GameState state = GameState.intro;

  bool get isPlaying => state == GameState.playing;
  bool get isIntro => state == GameState.intro;

  var animationStay;
  var animationRun;
  var animationJump;
  var animationDown;

  var enemyAnimationRun;
  var enemyAnimationAttack;
  var enemy2AnimationFly;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    overlays.add('mainMenuOverlay');

    final pref = await SharedPreferences.getInstance();
    if (pref.containsKey('bestScore')) {
      bestScore = pref.getInt('bestScore') ?? 0;
      bestScoreText.text = 'Best score: ${bestScore.toString()}';
    } else {
      pref.setInt('bestScore', bestScore);
    }

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
    await add(_dinoFloor);
    await add(scoreText);
    await add(bestScoreText);
    bestScoreText.position = Vector2(-bestScoreText.width / 2, 40);
    scoreText.position =
        Vector2(-bestScoreText.width / 2, bestScoreText.height + 35);
    scoreText.textRenderer = scoreStyle;
    bestScoreText.textRenderer = scoreStyle;
    await add(_dinoPlayer);
    enemys = [_enemy1, _enemy2];
    await add(enemys[0]);
    await add(enemys[1]);

    await add(_camera);

    _camera.position.y = gameRef.size.y / 2;
    _camera.size = Vector2(gameRef.size.x, gameRef.size.y);

    _dinoPlayer.position.y = _dinoGround.sizeWorldY * 0.60;
    enemys[0].position.y = _dinoGround.sizeWorldY * 0.60;
    enemys[1].position.y = _dinoGround.sizeWorldY * 0.60;

    _dinoFloor.position.y =
        _dinoGround.sizeWorldY * 0.80 + _dinoPlayer.size.y / 2;

    animationStay = await gameRef.loadSpriteAnimation(
        'dino-stay.png', Animations().spriteAnimationStay);

    animationRun = await gameRef.loadSpriteAnimation(
        'dino-run3.png', Animations().spriteAnimationRun);

    animationJump = await gameRef.loadSpriteAnimation(
        'dino-jump.png', Animations().spriteAnimationJump);

    animationDown = await gameRef.loadSpriteAnimation(
        'dino-down.png', Animations().spriteAnimationDown);

    enemyAnimationRun = await gameRef.loadSpriteAnimation(
        'enemy1.png', Animations().enemySpriteAnimationRun);

    enemyAnimationAttack = await gameRef.loadSpriteAnimation(
        'enemy1-attack.png', Animations().enemySpriteAnimationAttack);

    enemy2AnimationFly = await gameRef.loadSpriteAnimation(
        'enemy2.png', Animations().enemy2SpriteAnimationFly);

    _dinoPlayer.animation = animationStay;

    camera.followComponent(_camera);
  }

  void startBgmMusic() {
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('music/bg_music.ogg');
  }

  void stopBgmMusic() {
    FlameAudio.bgm.stop();
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
  bool onTapDown(TapDownInfo info) {
    //print("Player tap down on ${info.eventPosition.game} ${gameRef.size.y}");
    if (canTapJump && info.eventPosition.game.y < gameRef.size.y / 2) {
      isJumping = true;
      canTapJump = false;
    } else if (info.eventPosition.game.y > gameRef.size.y / 2 &&
        canTapJump &&
        !isJumping) {
      playerDown = true;
      _dinoPlayer.size = Vector2(100, 65);
    }

    return true;
  }

  @override
  bool onTapUp(TapUpInfo info) {
    playerDown = false;
    _dinoPlayer.size = Vector2(100, 100);
    if (info.eventPosition.game.y > gameRef.size.y / 2 &&
        canTapJump &&
        !isJumping) {
      gravity = 1.29;
    }

    return true;
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (isPlaying) {
      score += (60 * dt).toInt();
      scoreText.text = 'Score: ${score.toString()}';
      bestScore < score ? bestScore = score : bestScore = bestScore;

      bestScoreText.text = 'Best score: ${bestScore.toString()}';

      speed = maxSpeed;
      maxSpeed += 0.00005;
      if (!playerDown) {
        _dinoPlayer.animation = animationRun;
      } else {
        _dinoPlayer.animation = animationDown;
      }

      if (isJumping) {
        _dinoPlayer.animation = animationJump;
        if (_dinoPlayer.position.y + _dinoPlayer.size.y / 2 >
            _dinoFloor.position.y - jumpHeight) {
          gravity -= 0.05 * jumpSpeed;
          jumpSpeed > 0 ? jumpSpeed -= 0.055 : jumpSpeed = 0.2;
        } else {
          isJumping = false;
        }
      } else {
        if (_dinoPlayer.position.y + _dinoPlayer.size.y / 2 <
            _dinoFloor.position.y + 11) {
          gravity += 0.05 * jumpSpeed;
          jumpSpeed < 1 ? jumpSpeed += 0.045 : jumpSpeed = 1;
          _dinoPlayer.animation = animationJump;
        } else {
          jumpSpeed = 1;
          _dinoPlayer.position.y =
              _dinoPlayer.size.y / 2 + _dinoFloor.position.y + 11;
          canTapJump = true;
        }
      }

      if (enemys[0].position.y + enemys[0].size.y / 2 <
          _dinoFloor.position.y + 3) {
        enemy1Gravity += 0.05;
      }
      if (enemys[0].position.y + enemys[0].size.y / 2 <
          _dinoFloor.position.y + 3) {
        enemy2Gravity += 0.05;
      }

      enemys[1].animation = enemy2AnimationFly;

      if (enemys[0].position.x < 0 - gameRef.size.x &&
          enemys[0].position.x > 0 - gameRef.size.x * 1.5) {
        int random = Random().nextInt(2);
        enemys[random].position.x = gameRef.size.x + gameRef.size.x / 2;
        random == 0
            ? enemys[1].position.x = 0 - gameRef.size.x * 3
            : enemys[0].position.x = 0 - gameRef.size.x * 3;
      }
      if (enemys[1].position.x < 0 - gameRef.size.x &&
          enemys[1].position.x > 0 - gameRef.size.x * 1.5) {
        int random = Random().nextInt(2);
        enemys[random].position.x = gameRef.size.x + gameRef.size.x / 2;

        random == 0
            ? enemys[1].position.x = 0 - gameRef.size.x * 3
            : enemys[0].position.x = 0 - gameRef.size.x * 3;
      }
      if (enemys[0].position.x < _dinoPlayer.position.x + gameRef.size.x / 2) {
        enemy1Walk = false;
        enemys[0].animation = enemyAnimationAttack;
      } else {
        enemy1Walk = true;
        enemys[0].animation = enemyAnimationRun;
      }

      enemys[0].position.y = _dinoGround.sizeWorldY * 0.55 * enemy1Gravity;
      enemys[1].position.y = _dinoGround.sizeWorldY * 0.42 * enemy2Gravity;

      enemy1Walk
          ? enemys[0].position.x -= 6.8 * speed
          : enemys[0].position.x -= 5;
      enemys[1].position.x -= 6.8 * speed;

      _dinoPlayer.position.y = _dinoGround.sizeWorldY * 0.61 * gravity;

      if (isCollision) {
        stopGame();
      }
    }
    //print(gravity);

    _dinoPlayer.position.x =
        _camera.position.x - gameRef.size.x / 2 + _dinoPlayer.size.x / 0.9;
    _sky.position.x = _camera.position.x - _sky.size.x / 2;
    _dinoFloor.position.x = _camera.position.x - gameRef.size.x / 2;
    _dinoFloor.position.y = _dinoGround.sizeWorldY * 0.80 + 100 / 3.9;

    //_camera.position.x += 6 * speed;

    _dinoGround.position.x -= 5 * speed;
    _dinoGround2.position.x -= 5 * speed;
    _dinoTrees.position.x -= 4.8 * speed;
    _dinoTrees2.position.x -= 4.8 * speed;
    _dinoManyTrees.position.x -= 1.8 * speed;
    _dinoManyTrees2.position.x -= 1.8 * speed;
    _dinoBushes.position.x -= 1 * speed;
    _dinoBushes2.position.x -= 1 * speed;
    _dinoClouds.position.x -= 0.5 * speed;
    _dinoCloudsA.position.x -= 0.5 * speed;
    _dinoClouds2.position.x -= 0.7 * speed;
    _dinoClouds2A.position.x -= 0.7 * speed;
    _dinoClouds3.position.x -= 0.8 * speed;
    _dinoClouds3A.position.x -= 0.8 * speed;
    _dinoHill.position.x -= 0.8 * speed;
    _dinoHill2.position.x -= 0.8 * speed;
    _dinoHugeClouds.position.x -= 0.9 * speed;
    _dinoHugeClouds2.position.x -= 0.9 * speed;

    //print('${_camera.position} ------ ${_dinoPlayer.size}');

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

  void stopGame() async {
    stopBgmMusic();
    state = GameState.intro;
    overlays.add('mainMenuOverlay');
    gravity = 1;
    enemy1Gravity = 1;
    enemy2Gravity = 1;
    speed = 0;
    maxSpeed = 1;
    isJumping = false;
    canTapJump = true;
    jumpSpeed = 1;
    jumpHeight = 100;
    playerDown = false;
    enemy1Walk = true;

    score = 0;
    _dinoPlayer.animation = animationStay;

    enemys[1].position.x = 0 - gameRef.size.x * 3;
    enemys[0].position.x = gameRef.size.x + gameRef.size.x / 2;

    final pref = await SharedPreferences.getInstance();
    int savedScore = pref.getInt('bestScore')!.toInt();
    print('$savedScore ------ $bestScore');

    if (savedScore < bestScore) {
      pref.setInt('bestScore', bestScore);
    }
  }

  void startGame() {
    state = GameState.playing;
    startBgmMusic();
    isCollision = false;
    score = 0;

    overlays.remove('mainMenuOverlay');
  }
}
