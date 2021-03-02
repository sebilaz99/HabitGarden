import 'package:flutter/material.dart';
import 'package:blobs/blobs.dart';
import 'package:provider/provider.dart';

import '../../../styles.dart';
import '../setup_habit_viewmodel.dart';

class FlowerPicker extends StatelessWidget {
  static const types = const ['red', 'yellow', 'orange', 'black'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 170,
      decoration: CONTAINER_LEFT,
      child: PageView(
        onPageChanged: (index) =>
            context.read<SetupHabitViewModel>().flowerType = types[index],
        children: [for (var type in types) buildFlower(type)],
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
          child: Image.asset('assets/flowers/${type}_4.png', width: 150),
        ),
      ]);
}
