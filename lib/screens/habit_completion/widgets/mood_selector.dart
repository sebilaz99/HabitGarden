import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_garden/screens/habit_completion/habit_completion_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../styles.dart';

class MoodSelector extends StatelessWidget {
  static const List<String> assets = const [
    "assets/icons/mood_0.svg",
    "assets/icons/mood_1.svg",
    "assets/icons/mood_2.svg",
    "assets/icons/mood_3.svg",
    "assets/icons/mood_4.svg",
  ];

  static const List<Color> colors = const [
    Color(0xFFF84C4C),
    Color(0x80F84C4C),
    Color(0xFFFCFF80),
    Color(0x8095EF7F),
    Color(0xFF95EF7F),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: CONTAINER_RIGHT,
        padding: EdgeInsets.all(10),
        width: 350,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("How do you feel?", style: TEXT_24),
            Selector<HabitCompletionViewModel, int>(
              selector: (_, completion) => completion.mood,
              builder: (_, mood, __) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < assets.length; i++)
                    buildMoodButton(i, mood, context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMoodButton(int i, int mood, BuildContext context) =>
      GestureDetector(
        onTap: () => context.read<HabitCompletionViewModel>().mood = i,
        child: SvgPicture.asset(
          assets[i],
          color: i == mood ? colors[i] : null,
        ),
      );
}
