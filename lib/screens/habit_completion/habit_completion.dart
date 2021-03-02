import 'package:flutter/material.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:habit_garden/screens/habit_completion/habit_completion_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../styles.dart';
import '../../titlebar.dart';
import 'widgets/complete_button.dart';
import 'widgets/description.dart';
import 'widgets/entry_box.dart';
import 'widgets/flower_blob.dart';
import 'widgets/mood_selector.dart';

class HabitCompletion extends StatelessWidget {
  static const route = "habit_completion";

  @override
  Widget build(BuildContext context) {
    final TrackedHabit habit = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: TitleBar(habit.title, "habit_completion"),
      backgroundColor: BG_COLOR,
      body: ChangeNotifierProvider<HabitCompletionViewModel>(
        create: (_) => HabitCompletionViewModel(habit.isActive),
        builder: (_, __) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (MediaQuery.of(context).viewInsets.bottom == 0) ...[
              Row(children: [
                Expanded(child: Description(habit.description)),
                FlowerBlob(habit.flower.type, habit.flower.health),
              ]),
              MoodSelector(),
            ],
            EntryBox(),
            CompleteButton(habit),
          ],
        ),
      ),
    );
  }
}
