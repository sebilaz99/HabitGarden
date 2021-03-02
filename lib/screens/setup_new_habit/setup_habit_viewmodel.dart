import 'package:flutter/foundation.dart';

import 'schedule_entry_viewmodel.dart';
import 'widgets/flower_picker.dart';

class SetupHabitViewModel extends ChangeNotifier {
  String description = "";
  String _flowerType = FlowerPicker.types.first;
  int _difficulty = 2;
  List<ScheduleEntryViewModel> _schedule = [];

  String get flowerType => _flowerType;

  set flowerType(String value) {
    _flowerType = value;
    notifyListeners();
  }

  int get difficulty => _difficulty;

  set difficulty(int value) {
    _difficulty = value;
    notifyListeners();
  }

  List<ScheduleEntryViewModel> get schedule => _schedule;

  set schedule(List<ScheduleEntryViewModel> value) {
    _schedule = value;
    notifyListeners();
  }
}
