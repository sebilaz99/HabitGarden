import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_garden/models/message.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:provider/provider.dart';

import '../../database.dart';
import '../../navbar.dart';
import '../../styles.dart';
import 'widgets/garden_flower.dart';
import 'widgets/message_cloud.dart';

class Garden extends StatelessWidget {
  static const route = 'garden';

  @override
  Widget build(BuildContext context) {
    final habits = context
        .select<Database, Stream<Iterable<TrackedHabit>>>((db) => db.habits);
    final messages = context
        .select<Database, Stream<Iterable<Message>>>((db) => db.messages);

    return Scaffold(
      backgroundColor: BG_COLOR,
      bottomNavigationBar: NavigationBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          StreamBuilder<Iterable<Message>>(
            stream: messages,
            initialData: [],
            builder: (_, snapshot) => Container(
              height: 100,
              child: ListView(
                reverse: true,
                scrollDirection: Axis.horizontal,
                children: snapshot.data?.map((e) => MessageCloud(e))?.toList(),
              ),
            ),
          ),
          StreamBuilder<Iterable<TrackedHabit>>(
            stream: habits,
            builder: (_, snapshot) => AspectRatio(
              aspectRatio: 1,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset("assets/garden.svg"),
                  ...?snapshot.data?.map((e) => GardenFlower(e)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
