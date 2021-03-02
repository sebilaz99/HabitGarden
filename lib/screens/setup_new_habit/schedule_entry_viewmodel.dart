import 'package:flutter/foundation.dart';

class ScheduleEntryViewModel extends ChangeNotifier {
  int _hour;
  int _minute;
  List<bool> _days = List.filled(7, false);

  ScheduleEntryViewModel.copy(ScheduleEntryViewModel other)
      : _hour = other._hour,
        _minute = other._minute,
        _days = [...other._days];

  ScheduleEntryViewModel() {
    var time = DateTime.now();
    _hour = time.hour;
    _minute = time.minute;
  }

  int get hour => _hour;

  set hour(int value) {
    _hour = value;
    notifyListeners();
  }

  int get minute => _minute;

  set minute(int value) {
    _minute = value;
    notifyListeners();
  }

  List<bool> get days => _days;

  set days(List<bool> value) {
    _days = value;
    notifyListeners();
  }
}
