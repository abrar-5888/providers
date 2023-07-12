import 'package:flutter/material.dart';

class Movies with ChangeNotifier {
  List<dynamic> favList = [];

  void addToFavorites(dynamic item) {
    favList.add(item);
    notifyListeners();
  }

  void removeFromFavorites(dynamic item) {
    favList.remove(item);
    notifyListeners();
  }
}
