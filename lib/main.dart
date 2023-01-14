import 'package:flame/game.dart';
import 'package:flame/widgets.dart';
import 'package:flame_test/entity/game/game.dart';
import 'package:flame_test/entity/player/player.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(MyHomePage());
  });
}

final game = DinoGame();

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          GameWidget(
            game: game,
            overlayBuilderMap: <String, Widget Function(BuildContext, Game)>{
              'mainMenuOverlay': (context, game) => MainMenuOverlay(game)
            },
          ),
        ],
      ),
    );
  }
}

class MainMenuOverlay extends StatelessWidget {
  const MainMenuOverlay(this.game, {super.key});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                (game as DinoGame).startGame();
              },
              child: Text('Start Game'),
            ),
          ),
        ],
      ),
    );
  }
}

class GameOverlay extends StatelessWidget {
  const GameOverlay(this.game, {super.key});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [],
      ),
    );
  }
}
