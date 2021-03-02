import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';

import '../../../styles.dart';

class FlowerBlob extends StatelessWidget {
  final String type;
  final double health;

  const FlowerBlob(this.type, this.health, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Stack(children: [
        Blob.random(
          size: 200,
          minGrowth: 7,
          styles: BlobStyles(color: GRASS_COLOR),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            "assets/flowers/${type}_${health.ceil()}.png",
            height: 180,
          ),
        )
      ]),
    );
  }
}
