import 'package:flutter/material.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:habit_garden/screens/message/message.dart';

class GardenFlower extends StatelessWidget {
  final TrackedHabit habit;
  final String uid;

  const GardenFlower(this.habit, this.uid, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: habit.flower.x * MediaQuery.of(context).size.width - 100,
      top: habit.flower.y * MediaQuery.of(context).size.width - 100,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          Message.route,
          arguments: {"habit": habit, "uid": uid},
        ),
        child: Image.asset(
          'assets/flowers/${habit.flower.type}_${habit.flower.health.ceil()}.png',
          width: 200,
        ),
      ),
    );
  }
}
