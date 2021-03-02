import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:habit_garden/screens/habit_completion/habit_completion.dart';
import 'package:habit_garden/screens/online/online.dart';
import 'package:habit_garden/screens/other_garden/other_garden.dart';
import 'package:habit_garden/screens/tracked_habit_info/tracked_habit_info.dart';
import 'package:provider/provider.dart';

import 'auth.dart';
import 'database.dart';
import 'screens/garden/garden.dart';
import 'screens/message/message.dart';
import 'screens/new_habit_list/new_habit_list.dart';
import 'screens/profile/profile_page.dart';
import 'screens/settings/settings.dart';
import 'screens/setup_new_habit/setup_new_habit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  GetIt.I.registerSingleton<Auth>(Auth());
  GetIt.I.registerSingleton<Database>(Database(
    GetIt.I<Auth>().userStream.map((user) => user?.uid),
  ));

  runApp(
    MultiProvider(
      providers: [
        StreamProvider<User>(create: (_) => GetIt.I<Auth>().userStream),
        ChangeNotifierProvider<Database>.value(value: GetIt.I<Database>()),
      ],
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Garden.route,
        title: "Habit Garden",
        routes: {
          Garden.route: (_) => Garden(),
          HabitCompletion.route: (_) => HabitCompletion(),
          Message.route: (_) => Message(),
          NewHabitList.route: (_) => NewHabitList(),
          Online.route: (_) => Online(),
          OtherGarden.route: (_) => OtherGarden(),
          ProfilePage.route: (_) => ProfilePage(),
          Settings.route: (_) => Settings(),
          SetupNewHabit.route: (_) => SetupNewHabit(),
          TrackedHabitInfo.route: (_) => TrackedHabitInfo(),
        },
      ),
    ),
  );
}
