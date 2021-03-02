import 'package:flutter/material.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:habit_garden/screens/habit_completion/habit_completion.dart';

class GardenFlower extends StatefulWidget {
  final TrackedHabit habit;

  const GardenFlower(this.habit, {Key key}) : super(key: key);

  @override
  _GardenFlowerState createState() => _GardenFlowerState();
}

class _GardenFlowerState extends State<GardenFlower> {
  double x, y;

  @override
  void initState() {
    super.initState();
    x = widget.habit.flower.x;
    y = widget.habit.flower.y;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x * MediaQuery.of(context).size.width - 100,
      top: y * MediaQuery.of(context).size.width - 100,
      child: GestureDetector(
        onPanUpdate: (drag) => setState(() {
          x += drag.delta.dx / MediaQuery.of(context).size.width;
          y += drag.delta.dy / MediaQuery.of(context).size.width;
        }),
        onPanEnd: (_) => widget.habit.changeFlowerCoords(x, y),
        onTap: () => Navigator.pushNamed(
          context,
          HabitCompletion.route,
          arguments: widget.habit,
        ),
        child: Image.asset(
          'assets/flowers/${widget.habit.flower.type}_${widget.habit.flower.health.ceil()}.png',
          width: 200,
        ),
      ),
    );
  }
}
