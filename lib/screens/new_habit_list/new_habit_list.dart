import 'package:flutter/material.dart';
import 'package:habit_garden/screens/setup_new_habit/setup_new_habit.dart';

import '../../navbar.dart';
import '../../styles.dart';
import '../../titlebar.dart';
import 'new_habit_viewmodel.dart';
import 'widgets/new_habit_card.dart';

class NewHabitList extends StatelessWidget {
  static const route = 'new_habit_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar("New Habit", route),
      backgroundColor: BG_COLOR,
      bottomNavigationBar: NavigationBar(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: ListView(children: [
        for (var nh in newHabits)
          NewHabitCard(
            model: nh,
            onTap: () => Navigator.pushNamed(
              context,
              SetupNewHabit.route,
              arguments: nh,
            ),
          )
      ]),
    );
  }

  static const List<NewHabitViewModel> newHabits = const [
    NewHabitViewModel(
      "Exercise",
      "stretch in the morning",
    ),
    NewHabitViewModel(
      "Less technology",
      "check your feed just once a day",
    ),
    NewHabitViewModel(
      "Eat healthier",
      "more greens, less sugars",
    ),
    NewHabitViewModel(
      "Quit",
      "no more smoking and less coffee",
    ),
    NewHabitViewModel(
      "Sleep",
      "get at least 8 hours",
    ),
    NewHabitViewModel(
      "Read",
      "comic books don't count",
    ),
    NewHabitViewModel(
      "Socialize",
      "call your grandma",
    ),
    NewHabitViewModel(
      "Take care",
      "water your real flowers",
    ),
    NewHabitViewModel(
      "Practice",
      "that guitar won't play itself",
    ),
    NewHabitViewModel(
      "Mental health",
      "meditate in the morning",
    ),
  ];
}
