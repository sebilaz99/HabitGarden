import 'package:habit_garden/screens/setup_new_habit/schedule_entry_viewmodel.dart';

class ScheduleEntry {
  final int hour;
  final int minute;
  final List<bool> days;

  ScheduleEntry(this.hour, this.minute, this.days);

  ScheduleEntry.fromViewModel(ScheduleEntryViewModel entry)
      : this(
          entry.hour,
          entry.minute,
          [...entry.days],
        );

  ScheduleEntry.fromJson(Map<String, dynamic> json)
      : this(
          json["hour"] as int,
          json["minute"] as int,
          (json['days'] as List).map((e) => e as bool).toList(),
        );

  Map<String, dynamic> toJson() => {
        'hour': hour,
        'minute': minute,
        'days': days,
      };
}
