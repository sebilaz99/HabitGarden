import 'package:flutter/material.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:provider/provider.dart';

import '../../../styles.dart';

class DescriptionBox extends StatefulWidget {
  @override
  _DescriptionBoxState createState() => _DescriptionBoxState();
}

class _DescriptionBoxState extends State<DescriptionBox> {
  final descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    descriptionController.text = context.read<TrackedHabit>().description;
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: CONTAINER_RIGHT,
      child: TextField(
        maxLines: null,
        textInputAction: TextInputAction.done,
        cursorColor: DARK_COLOR,
        textAlignVertical: TextAlignVertical.top,
        controller: descriptionController,
        onSubmitted: (d) => context.read<TrackedHabit>().changeDescription(d),
        style: TEXT_24,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
