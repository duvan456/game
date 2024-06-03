import 'package:flutter/material.dart';
import 'package:game/modules/game/screens/widgets/game_board.dart';
import 'package:provider/provider.dart';
import 'package:game/modules/game/controllers/game_controller.dart';
import 'package:game/modules/game/screens/widgets/card_widget.dart';


class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Memory Match Game')),
      body: Consumer<GameController>(
        builder: (context, gameController, child) {
          return Column(
            children: [
              Text('Current Score: ${gameController.currentScore}'),
              Text('Best Score: ${gameController.bestScore}'),
              ElevatedButton(
                onPressed: () {
                  gameController.resetGame();
                },
                child: Text('Reset Game'),
              ),
              Expanded(
                child: GameBoard(),
              ),
            ],
          );
        },
      ),
    );
  }
}