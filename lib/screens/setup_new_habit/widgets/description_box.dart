import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../styles.dart';
import '../setup_habit_viewmodel.dart';

class DescriptionBox extends StatelessWidget {
  final String hint;

  const DescriptionBox({Key key, this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: CONTAINER_RIGHT,
      child: TextField(
        expands: true,
        maxLines: null,
        minLines: null,
        cursorColor: DARK_COLOR,
        textAlignVertical: TextAlignVertical.top,
        style: TEXT_24,
        onChanged: (d) => context.read<SetupHabitViewModel>().description = d,
        decoration: InputDecoration(
          hintText: hint,
          hintMaxLines: 3,
          hintStyle: TEXT_24.copyWith(color: DARK_COLOR.withAlpha(0x80)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
