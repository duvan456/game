import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:game/modules/game/screens/widgets/card_model.dart';
import 'package:game/modules/game/controllers/game_controller.dart';

class CardWidget extends StatelessWidget {
  final CardModel card;

  const CardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    final gameController = Provider.of<GameController>(context, listen: false);

    return GestureDetector(
      onTap: () {
        gameController.flipCard(card);
      },
      child: Card(
        child: card.isFlipped || card.isMatched
            ? Image.asset(card.imagePath)
            : Container(color: Colors.grey),
      ),
    );
  }
}
