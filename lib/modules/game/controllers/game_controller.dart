import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/widgets/card_model.dart';

class GameController extends ChangeNotifier {
  List<CardModel> _cards = [];
  CardModel? _selectedCard;
  int _currentScore = 0;
  int _bestScore = 0;
  bool _isDarkTheme = false;
  Locale _locale = const Locale('en');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  GameController() {
    _initializeCards();
    _loadPreferences();
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
  int get currentScore => _currentScore;
  int get bestScore => _bestScore;
  bool get isDarkTheme => _isDarkTheme;
  Locale get locale => _locale;

  void flipCard(CardModel card) {
    if (card.isFlipped || card.isMatched) return;
    
    card.isFlipped = true;
    _currentScore++;
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
    if (_allCardsMatched()) {
      _updateBestScore();
    }
    notifyListeners();
  }

  bool _allCardsMatched() {
    return _cards.every((card) => card.isMatched);
  }

  void _updateBestScore() {
    if (_bestScore == 0 || _currentScore < _bestScore) {
      _bestScore = _currentScore;
      _saveBestScore();
    }
  }

  void _saveBestScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('bestScore', _bestScore);
  }

  void _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _bestScore = prefs.getInt('bestScore') ?? 0;
    _isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    String? localeString = prefs.getString('locale');
    if (localeString != null) {
      _locale = Locale(localeString);
    }
    notifyListeners();
  }

  void toggleTheme() async {
    _isDarkTheme = !_isDarkTheme;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkTheme', _isDarkTheme);
    notifyListeners();
  }

  void setLocale(Locale locale) async {
    _locale = locale;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale.languageCode);
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw Exception('Login failed');
    }
  }

  Future<void> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
        'email': email,
        'createdAt': Timestamp.now(),
      });
    } catch (e) {
      throw Exception('Registration failed');
    }
  }

  void resetGame() {
    _initializeCards();
    _currentScore = 0;
    notifyListeners();
  }
}
