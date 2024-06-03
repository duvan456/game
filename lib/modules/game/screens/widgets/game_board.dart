import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:game/modules/game/controllers/game_controller.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final gameController = Provider.of<GameController>(context);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemCount: gameController.cards.length,
      itemBuilder: (context, index) {
        final card = gameController.cards[index];
        return GestureDetector(
          onTap: () => gameController.flipCard(card),
          child: Card(
            child: Center(
              child: card.isFlipped || card.isMatched
                  ? Image.asset(card.imagePath)
                  : Container(),
            ),
          ),
        );
      },
    );
  }
}
