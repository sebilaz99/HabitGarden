import 'package:habit_garden/screens/habit_completion/habit_completion_viewmodel.dart';

class CompletionStatus {
  final bool completed;
  final String entry;
  final int mood;
  final DateTime timestamp;

  CompletionStatus(this.completed, this.entry, this.mood, this.timestamp);

  CompletionStatus.fromViewModel(HabitCompletionViewModel completion)
      : this(
          completion.completed,
          completion.entry,
          completion.mood,
          DateTime.now(),
        );

  CompletionStatus.fromJson(Map<String, dynamic> json)
      : this(
          json["completed"] as bool,
          json["entry"] as String,
          json["mood"] as int,
          DateTime.parse(json["timestamp"] as String),
        );

  Map<String, dynamic> toJson() => {
        "completed": completed,
        "entry": entry,
        "mood": mood,
        "timestamp": timestamp?.toIso8601String(),
      };
}
