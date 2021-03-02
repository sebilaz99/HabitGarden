import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_garden/models/completion_status.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:habit_garden/screens/habit_completion/widgets/mood_selector.dart';
import 'package:habit_garden/styles.dart';
import 'package:provider/provider.dart';

class CompletionHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: FutureBuilder<Iterable<CompletionStatus>>(
        initialData: [],
        future: Provider.of<TrackedHabit>(context, listen: false).history,
        builder: (_, history) {
          return history.data.isEmpty
              ? buildEmptyCard()
              : PageView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  children: [
                    for (var status in history.data.toList().reversed)
                      buildCard(status),
                  ],
                );
        },
      ),
    );
  }

  Widget buildEmptyCard() => Container(
        padding: EdgeInsets.all(50),
        margin: EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 10),
        decoration: CONTAINER_MIDDLE,
        alignment: Alignment.topCenter,
        width: 400,
        child: Text(
          "Your completion history will apppear here...",
          style: TEXT_24,
          textAlign: TextAlign.center,
        ),
      );

  Widget buildCard(CompletionStatus status) => Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 10),
        decoration: CONTAINER_MIDDLE,
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: status.completed ? GRASS_COLOR : RED,
                  ),
                ),
                Text(
                  "${status.timestamp.day < 10 ? '0' : ''}${status.timestamp.day}." +
                      "${status.timestamp.month < 10 ? '0' : ''}${status.timestamp.month}." +
                      "${status.timestamp.year}",
                  style: TEXT_24,
                ),
                Text(
                  "${status.timestamp.hour < 10 ? '0' : ''}${status.timestamp.hour}:" +
                      "${status.timestamp.minute < 10 ? '0' : ''}${status.timestamp.minute}",
                  style: TEXT_24,
                ),
                SvgPicture.asset(
                  "assets/icons/mood_${status.mood}.svg",
                  color: MoodSelector.colors[status.mood],
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(child: Text(status.entry, style: TEXT_18)),
          ],
        ),
      );
}
