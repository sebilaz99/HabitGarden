import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../styles.dart';
import '../schedule_entry_viewmodel.dart';
import '../setup_habit_viewmodel.dart';
import 'add_entry_button.dart';
import 'day_selector.dart';
import 'time_selector.dart';

class ScheduleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ScheduleEntryViewModel>(
      create: (_) => ScheduleEntryViewModel(),
      builder: (context, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Selector<SetupHabitViewModel, List<ScheduleEntryViewModel>>(
            selector: (_, habit) => habit.schedule,
            builder: (_, schedule, __) => Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [for (var entry in schedule) TimeCard(entry)],
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(children: [
            Expanded(child: TimeSelector()),
            SizedBox(width: 20),
            AddEntryButton(),
          ]),
          SizedBox(height: 10),
          DaySelector(),
        ],
      ),
    );
  }
}

class TimeCard extends StatelessWidget {
  final ScheduleEntryViewModel entry;

  const TimeCard(this.entry, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        height: 50,
        width: 120,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 10),
        decoration: CONTAINER_MIDDLE,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${entry.hour < 10 ? '0' : ''}" +
                  "${entry.hour}:" +
                  "${entry.minute < 10 ? '0' : ''}" +
                  "${entry.minute}",
              style: TEXT_24,
            ),
            GestureDetector(
              child: Icon(
                Icons.highlight_remove_rounded,
                color: DARK_COLOR,
                size: 30,
              ),
              onTap: () {
                final vm = context.read<SetupHabitViewModel>();
                vm.schedule = [...vm.schedule]..remove(entry);
              },
            ),
          ],
        ),
      );
}
