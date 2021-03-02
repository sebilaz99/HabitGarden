import 'package:flutter/material.dart';
import 'package:habit_garden/screens/setup_new_habit/schedule_entry_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:habit_garden/styles.dart';

class TimeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: CONTAINER_LEFT,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildSpinner(
              value: context.select<ScheduleEntryViewModel, int>((e) => e.hour),
              mod: 24,
              onChanged: (newHour) =>
                  context.read<ScheduleEntryViewModel>().hour = newHour,
            ),
            Text(':', style: TEXT_36),
            buildSpinner(
              value:
                  context.select<ScheduleEntryViewModel, int>((e) => e.minute),
              mod: 60,
              onChanged: (newMinute) =>
                  context.read<ScheduleEntryViewModel>().minute = newMinute,
            ),
          ],
        ),
      );

  Widget buildSpinner({int value, int mod, Function(int) onChanged}) =>
      Column(children: [
        GestureDetector(
          child: Icon(Icons.arrow_drop_up, color: DARK_COLOR, size: 50),
          onTap: () => onChanged(++value % mod),
        ),
        Text("${value < 10 ? '0' : ''}" + "$value", style: TEXT_36),
        GestureDetector(
          child: Icon(Icons.arrow_drop_down, color: DARK_COLOR, size: 50),
          onTap: () => onChanged(--value % mod),
        ),
      ]);
}
