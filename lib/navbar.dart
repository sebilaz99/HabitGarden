import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_garden/screens/online/online.dart';

import 'screens/garden/garden.dart';
import 'screens/new_habit_list/new_habit_list.dart';
import 'screens/profile/profile_page.dart';
import 'styles.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          navButton("garden", Garden.route, context),
          navButton("profile", ProfilePage.route, context),
          navButton("online", Online.route, context),
          navButton("plant", NewHabitList.route, context),
        ],
      ),
      decoration: NAV,
    );
  }

  Widget navButton(String icon, String route, BuildContext context) =>
      GestureDetector(
        child: SvgPicture.asset(
          "assets/icons/nav_$icon${ModalRoute.of(context).settings.name == route ? '_active' : ''}.svg",
        ),
        onTap: () {
          if (route != null &&
              route.isNotEmpty &&
              route != ModalRoute.of(context).settings.name) {
            if (route == Garden.route)
              Navigator.pop(context);
            else if (ModalRoute.of(context).settings.name == Garden.route)
              Navigator.pushNamed(context, route);
            else
              Navigator.popAndPushNamed(context, route);
          }
        },
      );
}
