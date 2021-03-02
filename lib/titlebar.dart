import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'styles.dart';

class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  final String path;
  final String title;

  const TitleBar(this.title, this.path, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SvgPicture.asset(
        'assets/titlebars/$path.svg',
        fit: BoxFit.fill,
        width: double.infinity,
      ),
      Center(child: Text(title, style: TEXT_36)),
    ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
