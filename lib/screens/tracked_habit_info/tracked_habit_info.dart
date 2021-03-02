import 'package:flutter/material.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:habit_garden/screens/setup_new_habit/widgets/header.dart';
import 'package:provider/provider.dart';

import '../../styles.dart';
import 'widgets/completion_history.dart';
import 'widgets/description_box.dart';
import 'widgets/flower_picker.dart';
import 'widgets/kill_button.dart';
import 'widgets/schedule_list.dart';

class TrackedHabitInfo extends StatelessWidget {
  static const route = "tracked_habit_info";

  @override
  Widget build(BuildContext context) {
    final TrackedHabit habit = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: BG_COLOR,
      resizeToAvoidBottomInset: false,
      body: Provider<TrackedHabit>.value(
        value: habit,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Header(title: habit.title, icon: "icon"),
            Row(children: [
              FlowerPicker(),
              SizedBox(width: 20),
              Expanded(child: DescriptionBox()),
            ]),
            KillButton(),
            ScheduleList(),
            CompletionHistory(),
          ],
        ),
      ),
    );
  }
}
