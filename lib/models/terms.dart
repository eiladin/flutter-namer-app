import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class TermsModel extends ChangeNotifier {
  var _favorites = <WordPair>[];
  var current = WordPair.random();
  var _selectedForRemove = <WordPair>[];

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  List<WordPair> getFavorites() => _favorites;
  List<WordPair> getSelectedForRemove() => _selectedForRemove;

  void toggleFavorite() {
    if (_favorites.contains(current)) {
      _favorites.remove(current);
    } else {
      _favorites.add(current);
    }
    notifyListeners();
  }

  void removeSelected() {
    for (var item in _selectedForRemove) {
      _favorites.remove(item);
    }
    _selectedForRemove.clear();
    notifyListeners();
  }

  void selectForRemove(item) {
    _selectedForRemove.add(item);
    notifyListeners();
  }

  void unselectForRemove(item) {
    _selectedForRemove.remove(item);
    notifyListeners();
  }

  void selectAllForRemove() {
    for (var item in _favorites) {
      if (!_selectedForRemove.contains(item)) {
        _selectedForRemove.add(item);
      }
    }
    notifyListeners();
  }

  void clearSelectedForRemove() {
    _selectedForRemove.clear();
    notifyListeners();
  }
}
