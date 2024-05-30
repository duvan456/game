import 'package:flutter/material.dart';
import 'card_model.dart';

class GameController extends ChangeNotifier {
  List<CardModel> _cards = [];
  CardModel? _selectedCard;

  GameController() {
    _initializeCards();
  }

  void _initializeCards() {
    List<String> imagePaths = [
      'assets/images/a.png',
      'assets/images/b.png',
      'assets/images/c.png',
      'assets/images/d.png',
      'assets/images/e.png',
      'assets/images/f.png',
      'assets/images/g.png',
      'assets/images/h.png',
      'assets/images/a.png',
      'assets/images/b.png',
      'assets/images/c.png',
      'assets/images/d.png',
      'assets/images/e.png',
      'assets/images/f.png',
      'assets/images/g.png',
      'assets/images/h.png',
    ];
    _cards = imagePaths
        .map((path) => CardModel(imagePath: path))
        .toList();
    _cards.shuffle();
  }

  List<CardModel> get cards => _cards;

  void flipCard(CardModel card) {
    if (card.isFlipped || card.isMatched) return;
    
    card.isFlipped = true;
    notifyListeners();
    
    if (_selectedCard == null) {
      _selectedCard = card;
    } else {
      if (_selectedCard!.imagePath == card.imagePath) {
        _selectedCard!.isMatched = true;
        card.isMatched = true;
        _selectedCard = null; 
      } else {
        
        final previousSelectedCard = _selectedCard;
        Future.delayed(Duration(seconds: 1), () {
          previousSelectedCard?.isFlipped = false;
          card.isFlipped = false;
          notifyListeners();
        });
        _selectedCard = null;
      }
    }
    notifyListeners();
  }
}
