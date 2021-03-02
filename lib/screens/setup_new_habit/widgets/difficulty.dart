import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../styles.dart';
import '../setup_habit_viewmodel.dart';

class Difficulty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MAIN_COLOR,
      padding: EdgeInsets.all(10),
      child: Column(children: [
        Text('Difficulty', style: TEXT_24),
        SizedBox(height: 20),
        Selector<SetupHabitViewModel, int>(
          selector: (_, th) => th.difficulty,
          builder: (_, difficulty, __) => Slider(
            min: 0,
            max: 4,
            divisions: 4,
            value: difficulty.toDouble(),
            activeColor: DARK_COLOR,
            inactiveColor: CONTAINER_COLOR,
            onChanged: (d) {
              context.read<SetupHabitViewModel>().difficulty = d.toInt();
            },
          ),
        ),
      ]),
    );
  }
}
