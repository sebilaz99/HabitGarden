import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:habit_garden/models/completion_status.dart';
import 'package:habit_garden/screens/setup_new_habit/setup_habit_viewmodel.dart';

import '../database.dart';
import 'flower.dart';
import 'schedule_entry.dart';

class TrackedHabit {
  final String id;
  final String title;
  final String description;
  final List<ScheduleEntry> schedule;
  final Flower flower;
  final DateTime timestamp;
  final int difficulty;

  TrackedHabit(this.title, this.description, this.schedule, this.flower,
      this.timestamp, this.difficulty,
      [this.id]);

  TrackedHabit.fromViewModel(String title, SetupHabitViewModel habit)
      : this(
          title,
          habit.description,
          habit.schedule
              .map((entry) => ScheduleEntry.fromViewModel(entry))
              .toList(),
          Flower(
            habit.flowerType,
            4,
            Random().nextDouble(),
            Random().nextDouble(),
          ),
          DateTime.now(),
          habit.difficulty,
        );

  TrackedHabit.fromFirebase(DocumentSnapshot doc)
      : this(
          doc["title"] as String,
          doc["description"] as String,
          (doc["schedule"] as List)
              .map((e) => ScheduleEntry.fromJson(e as Map<String, dynamic>))
              .toList(),
          Flower.fromJson(doc["flower"] as Map<String, dynamic>),
          DateTime.parse(doc["timestamp"] as String),
          doc["difficulty"] as int,
          doc.id,
        );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "schedule": schedule.map((e) => e.toJson()).toList(),
        "flower": flower.toJson(),
        "timestamp": timestamp.toIso8601String(),
        "difficulty": difficulty,
      };

  changeFlowerCoords(double x, double y) =>
      GetIt.I<Database>().changeFlowerCoords(id, x, y);

  changeFlowerType(String type) =>
      GetIt.I<Database>().changeFlowerType(id, type);

  changeDescription(String description) =>
      GetIt.I<Database>().changeDescription(id, description);

  addCompletionStatus(CompletionStatus status) =>
      GetIt.I<Database>().addCompletionStatus(id, status);

  decayFlower() => GetIt.I<Database>()
      .changeFlowerHealth(id, flower.health - pow(2.0, difficulty - 4));

  kill() {
    GetIt.I<Database>().changeFlowerHealth(id, 1.0);
    GetIt.I<Database>().clearSchedule(id);
  }

  bool get isActive {
    final now = DateTime.now();
    return schedule
        .where((e) => e.days[now.weekday - 1])
        .map((e) => DateTime(now.year, now.month, now.day, e.hour, e.minute))
        .where((e) =>
            e.isAfter(now.subtract(Duration(minutes: 15))) &&
            e.isBefore(now.add(Duration(minutes: 15))))
        .isNotEmpty;
  }

  Future<Iterable<CompletionStatus>> get history async =>
      await GetIt.I<Database>().getCompletionHistory(id);
}
