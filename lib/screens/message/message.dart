import 'package:flutter/material.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:habit_garden/screens/message/messave_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../styles.dart';
import '../../titlebar.dart';
import 'widgets/send_button.dart';
import 'widgets/description.dart';
import 'widgets/message_box.dart';
import 'widgets/flower_blob.dart';

class Message extends StatelessWidget {
  static const route = 'message';

  @override
  Widget build(BuildContext context) {
    final TrackedHabit habit = (ModalRoute.of(context).settings.arguments
        as Map<String, dynamic>)["habit"];
    final String uid = (ModalRoute.of(context).settings.arguments
    as Map<String, dynamic>)["uid"];

    return Scaffold(
      appBar: TitleBar(habit.title, "habit_completion"),
      backgroundColor: BG_COLOR,
      body: Provider<MessageViewModel>(
        create: (_) => MessageViewModel(),
        builder: (_, __) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (MediaQuery.of(context).viewInsets.bottom == 0) ...[
              Row(children: [
                Expanded(child: Description(habit.description)),
                FlowerBlob(habit.flower.type, habit.flower.health),
              ]),
            ],
            MessageBox(),
            SendButton(uid),
          ],
        ),
      ),
    );
  }
}
