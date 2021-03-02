import 'package:flutter/material.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:blobs/blobs.dart';

import '../../../styles.dart';

class HabitCard extends StatelessWidget {
  final TrackedHabit habit;
  final onTap;

  const HabitCard(this.habit, this.onTap, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(children: [
        Stack(children: [
          Blob.random(
            size: 170,
            minGrowth: 7,
            styles: BlobStyles(color: GRASS_COLOR),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/flowers/${habit.flower.type}_${habit.flower.health.ceil()}.png',
              width: 150,
            ),
          ),
        ]),
        Expanded(
          child: Container(
            height: 125,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(habit.title, style: TEXT_24),
                Flexible(
                  child: Text(
                    habit.description,
                    style: TEXT_18,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            decoration: CONTAINER_RIGHT,
          ),
        )
      ]),
    );
  }
}
