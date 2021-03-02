import 'package:flutter/material.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:provider/provider.dart';

import '../../../styles.dart';

class KillButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          context.read<TrackedHabit>().kill();
          Navigator.pop(context);
        },
        child: Container(
          height: 80,
          width: 180,
          decoration: CONTAINER_LEFT.copyWith(color: RED),
          alignment: Alignment.center,
          child: Text("Kill", style: TEXT_24.copyWith(color: Colors.white)),
        ),
      ),
    );
  }
}
