import 'package:flutter/material.dart';
import 'package:habit_garden/models/completion_status.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:habit_garden/screens/habit_completion/habit_completion_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../styles.dart';

class CompleteButton extends StatelessWidget {
  final TrackedHabit habit;

  const CompleteButton(this.habit, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool active =
        Provider.of<HabitCompletionViewModel>(context, listen: false).completed;
    return GestureDetector(
      onTap: () {
        habit.addCompletionStatus(
          CompletionStatus.fromViewModel(
            context.read<HabitCompletionViewModel>(),
          ),
        );
        if (!active) habit.decayFlower();
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.only(left: 20),
        alignment: Alignment.center,
        height: 70,
        decoration: NAV.copyWith(color: active ? GRASS_COLOR : RED),
        child: Text(active ? "I did it!" : "Can't do it...", style: TEXT_36),
      ),
    );
  }
}
