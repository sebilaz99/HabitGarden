import 'package:flutter/material.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:habit_garden/screens/tracked_habit_info/tracked_habit_info.dart';
import 'package:provider/provider.dart';

import '../../database.dart';
import '../../navbar.dart';
import '../../styles.dart';
import 'widgets/habit_card.dart';
import 'widgets/profile_titlebar.dart';

class ProfilePage extends StatelessWidget {
  static const route = "profile_page";

  @override
  Widget build(BuildContext context) {
    final habitStream = context
        .select<Database, Stream<Iterable<TrackedHabit>>>((db) => db.habits);

    return Scaffold(
      appBar: ProfileTitleBar(),
      backgroundColor: BG_COLOR,
      bottomNavigationBar: NavigationBar(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<Iterable<TrackedHabit>>(
        stream: habitStream,
        builder: (_, snapshot) => ListView(
          children: [
            ...?snapshot.data?.map((habit) => HabitCard(
                  habit,
                  () => Navigator.pushNamed(
                    context,
                    TrackedHabitInfo.route,
                    arguments: habit,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
