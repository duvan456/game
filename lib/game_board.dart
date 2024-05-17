import 'package:flutter/material.dart';
import 'package:game/game_controller.dart';
import 'package:provider/provider.dart';

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
              child: Text(card.isFlipped || card.isMatched
                  ? card.identifier
                  : ''),
            ),
          ),
        );
      },
    );
  }
}