import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:provider/provider.dart';

import '../../database.dart';
import '../../styles.dart';
import 'widgets/garden_flower.dart';

class OtherGarden extends StatelessWidget {
  static const route = 'other_garden';

  @override
  Widget build(BuildContext context) {
    final String uid = ModalRoute.of(context).settings.arguments;

    final habits = context
        .select<Database, Stream<Iterable<TrackedHabit>>>((db) => db.getUserHabits(uid));

    return Scaffold(
      backgroundColor: BG_COLOR,
      body: StreamBuilder<Iterable<TrackedHabit>>(
        stream: habits,
        builder: (_, snapshot) => Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SvgPicture.asset("assets/garden.svg"),
                ...?snapshot.data?.map((e) => GardenFlower(e, uid)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
