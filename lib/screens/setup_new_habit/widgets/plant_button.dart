import 'package:flutter/material.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:habit_garden/screens/garden/garden.dart';
import 'package:provider/provider.dart';

import '../../../database.dart';
import '../../../styles.dart';
import '../setup_habit_viewmodel.dart';

class PlantButton extends StatelessWidget {
  final String title;

  const PlantButton(this.title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final habit = TrackedHabit.fromViewModel(
          title,
          context.read<SetupHabitViewModel>(),
        );
        context.read<Database>().addHabit(habit);
        Navigator.popUntil(context, ModalRoute.withName(Garden.route));
      },
      child: Container(
        margin: EdgeInsets.only(left: 20),
        alignment: Alignment.center,
        height: 70,
        decoration: NAV,
        child: Text('Plant it!', style: TEXT_36),
      ),
    );
  }
}
