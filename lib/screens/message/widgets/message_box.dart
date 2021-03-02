import 'package:flutter/material.dart';
import 'package:habit_garden/screens/message/messave_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../styles.dart';

class MessageBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Container(
        height: 200,
        width: 380,
        decoration: CONTAINER_RIGHT,
        child: TextField(
          expands: true,
          maxLines: null,
          minLines: null,
          cursorColor: DARK_COLOR,
          textAlignVertical: TextAlignVertical.top,
          style: TEXT_24,
          onChanged: (e) => context.read<MessageViewModel>().message = e,
          decoration: InputDecoration(
            hintText: "Leave a motivational message...",
            hintMaxLines: 3,
            hintStyle: TEXT_24.copyWith(color: DARK_COLOR.withAlpha(0x80)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
