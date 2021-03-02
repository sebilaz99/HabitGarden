import 'package:flutter/material.dart';

class HabitCompletionViewModel extends ChangeNotifier {
  final bool completed;
  String entry = "";
  int _mood = 2;

  HabitCompletionViewModel(this.completed);

  int get mood => _mood;

  set mood(int value) {
    _mood = value;
    notifyListeners();
  }
}
