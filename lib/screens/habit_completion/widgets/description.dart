import 'package:flutter/material.dart';

import '../../../styles.dart';

class Description extends StatelessWidget {
  final String description;

  const Description(this.description, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: CONTAINER_LEFT,
      padding: EdgeInsets.all(10),
      child: Text(description, style: TEXT_18),
    );
  }
}
