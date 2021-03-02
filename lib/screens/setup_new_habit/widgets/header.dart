import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../styles.dart';

class Header extends StatelessWidget {
  final String title;
  final String icon;

  const Header({Key key, this.title, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: 100,
          height: 100,
          child: Text('icon', style: TEXT_18),
          decoration: CONTAINER_TOP_LEFT,
        ),
        SizedBox(width: 20),
        Expanded(
          child: Stack(children: [
            Positioned.fill(
              child: SvgPicture.asset(
                "assets/titlebars/setup.svg",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 100,
              child: Text(title, style: TEXT_36),
            ),
          ]),
        ),
      ],
    );
  }
}
