import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../styles.dart';
import '../new_habit_viewmodel.dart';

class NewHabitCard extends StatelessWidget {
  final NewHabitViewModel model;
  final onTap;

  NewHabitCard({Key key, this.model, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 125,
          width: 125,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text("icon", style: TEXT_18),
          decoration: CONTAINER_LEFT,
        ),
        SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 125,
            padding: EdgeInsets.all(20),
            child: Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.title, style: TEXT_24),
                    Text(model.description, style: TEXT_18),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: SvgPicture.asset("assets/icons/plus.svg"),
              )
            ]),
            decoration: CONTAINER_RIGHT,
          ),
        ),
      ],
    );
  }
}
