import 'package:flutter/material.dart';
import 'package:habit_garden/screens/setup_new_habit/schedule_entry_viewmodel.dart';
import 'package:habit_garden/screens/setup_new_habit/setup_habit_viewmodel.dart';
import 'package:habit_garden/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AddEntryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GestureDetector(
        child: Container(
          width: 70,
          height: 70,
          alignment: Alignment.center,
          decoration: CONTAINER_RIGHT,
          child: SvgPicture.asset("assets/icons/plus.svg"),
        ),
        onTap: () {
          final habitVm = context.read<SetupHabitViewModel>();
          final entryVm = context.read<ScheduleEntryViewModel>();
          habitVm.schedule = [
            ...habitVm.schedule,
            ScheduleEntryViewModel.copy(entryVm)
          ];
        },
      );
}
