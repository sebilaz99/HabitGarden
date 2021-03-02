import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:habit_garden/models/completion_status.dart';
import 'package:habit_garden/models/message.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:habit_garden/screens/habit_completion/habit_completion_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../database.dart';
import '../../../styles.dart';
import '../messave_viewmodel.dart';

class SendButton extends StatelessWidget {
  final String uid;

  const SendButton(this.uid, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GetIt.I<Database>().addMessage(
          uid,
          Message.fromViewModel(
            context.read<MessageViewModel>(),
          ),
        );
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.only(left: 20),
        alignment: Alignment.center,
        height: 70,
        decoration: NAV,
        child: Text("Send!", style: TEXT_36),
      ),
    );
  }
}
