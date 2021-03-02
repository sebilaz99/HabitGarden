import 'package:flutter/material.dart';
import 'package:blobs/blobs.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:provider/provider.dart';

import '../../../styles.dart';

class FlowerPicker extends StatefulWidget {
  static const types = const ['red', 'yellow', 'orange', 'black'];

  @override
  _FlowerPickerState createState() => _FlowerPickerState();
}

class _FlowerPickerState extends State<FlowerPicker> {
  PageController pageController;
  double health;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
        initialPage: FlowerPicker.types
            .indexOf(context.read<TrackedHabit>().flower.type));
    health = context.read<TrackedHabit>().flower.health;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 170,
      decoration: CONTAINER_LEFT,
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => context
            .read<TrackedHabit>()
            .changeFlowerType(FlowerPicker.types[index]),
        children: [
          for (var type in FlowerPicker.types) buildFlower(type),
        ],
      ),
    );
  }

  Widget buildFlower(String type) => Stack(children: [
        Blob.random(
          size: 170,
          minGrowth: 7,
          styles: BlobStyles(color: GRASS_COLOR),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            'assets/flowers/${type}_${health.ceil()}.png',
            width: 150,
          ),
        ),
      ]);
}
