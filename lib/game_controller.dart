import 'package:flutter/material.dart';
import 'package:game/card_model.dart';

class GameController extends ChangeNotifier {
  List<CardModel> _cards = [];
  CardModel? _selectedCard;

  GameController() {
    _initializeCards();
  }

  void _initializeCards() {
    List<String> identifiers = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
    _cards = [...identifiers, ...identifiers]
        .map((id) => CardModel(identifier: id))
        .toList();
    _cards.shuffle();
  }

  List<CardModel> get cards => _cards;

  void flipCard(CardModel card) {
    if (card.isFlipped || card.isMatched) return;
    card.isFlipped = true;
    if (_selectedCard == null) {
      _selectedCard = card;
    } else {
      if (_selectedCard!.identifier == card.identifier) {
        _selectedCard!.isMatched = true;
        card.isMatched = true;
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          _selectedCard!.isFlipped = false;
          card.isFlipped = false;
          notifyListeners();
        });
      }
      _selectedCard = null;
    }
    notifyListeners();
  }
}
