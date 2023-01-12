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
    runApp(MyGame());
  });
}

class MyGame extends StatelessWidget {
  const MyGame({super.key});

  @override
  Widget build(BuildContext context) {
    final game = DinoGame();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          GameWidget(
            game: game,
          ),
          Container(
            width: 200,
            height: 2,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
