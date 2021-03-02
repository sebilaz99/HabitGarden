import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../styles.dart';
import '../schedule_entry_viewmodel.dart';

class DaySelector extends StatelessWidget {
  static const List<String> options = const ["M", "T", "W", "T", "F", "S", "S"];

  Widget buildDayButton(List<bool> days, int i, BuildContext context) =>
      GestureDetector(
        child: Container(
          width: 55,
          height: 55,
          alignment: Alignment.center,
          decoration:
              days[i] ? CONTAINER_MIDDLE.copyWith(color: DARK_COLOR) : null,
          child: Text(
            options[i],
            style: days[i] ? TEXT_24.copyWith(color: CONTAINER_COLOR) : TEXT_24,
          ),
        ),
        onTap: () {
          final vm = context.read<ScheduleEntryViewModel>();
          vm.days = [...vm.days]..[i] = !vm.days[i];
        },
      );

  @override
  Widget build(BuildContext context) =>
      Selector<ScheduleEntryViewModel, List<bool>>(
        selector: (_, entry) => entry.days,
        builder: (_, days, __) => Container(
          decoration: CONTAINER_LEFT,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < days.length; i++)
                buildDayButton(days, i, context)
            ],
          ),
        ),
      );
}
