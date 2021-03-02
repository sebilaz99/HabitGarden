import 'package:flutter/material.dart';
import 'package:habit_garden/models/schedule_entry.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:habit_garden/styles.dart';
import 'package:provider/provider.dart';

class ScheduleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final schedule = Provider.of<TrackedHabit>(context, listen: false).schedule;

    return Row(
      children: [
        Container(
          width: 180,
          height: 80,
          decoration: CONTAINER_LEFT.copyWith(color: MAIN_COLOR),
          alignment: Alignment.center,
          child: Text("Schedule", style: TEXT_24),
        ),
        Expanded(
          child: Container(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [for (var entry in schedule) buildScheduleCard(entry)],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildScheduleCard(ScheduleEntry entry) => Container(
        width: 150,
        decoration: CONTAINER_MIDDLE,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                "${entry.hour < 10 ? '0' : ''}" +
                    "${entry.hour}:" +
                    "${entry.minute < 10 ? '0' : ''}" +
                    "${entry.minute}",
                style: TEXT_18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var day in entry.days)
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: DARK_COLOR, width: 2),
                      color: day ? DARK_COLOR : null,
                    ),
                  )
              ],
            )
          ],
        ),
      );
}
