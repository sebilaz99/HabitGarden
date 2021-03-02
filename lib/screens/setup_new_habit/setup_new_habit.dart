import 'package:flutter/material.dart';
import 'package:habit_garden/screens/new_habit_list/new_habit_viewmodel.dart';
import 'package:habit_garden/screens/setup_new_habit/setup_habit_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../styles.dart';
import 'widgets/description_box.dart';
import 'widgets/difficulty.dart';
import 'widgets/flower_picker.dart';
import 'widgets/header.dart';
import 'widgets/plant_button.dart';
import 'widgets/schedule_list.dart';

class SetupNewHabit extends StatelessWidget {
  static const route = 'setup_new_habit';

  @override
  Widget build(BuildContext context) {
    final NewHabitViewModel newHabit =
        ModalRoute.of(context).settings.arguments ??
            NewHabitViewModel("title", "description");

    return ChangeNotifierProvider<SetupHabitViewModel>(
      create: (_) => SetupHabitViewModel(),
      builder: (context, _) => Scaffold(
        backgroundColor: BG_COLOR,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Header(title: newHabit.title, icon: "icon"),
            Row(children: [
              FlowerPicker(),
              SizedBox(width: 20),
              Expanded(child: DescriptionBox(hint: newHabit.description)),
            ]),
            Difficulty(),
            ScheduleList(),
            PlantButton(newHabit.title),
          ],
        ),
      ),
    );
  }
}
