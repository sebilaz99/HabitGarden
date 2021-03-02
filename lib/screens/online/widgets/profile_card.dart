import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_garden/screens/other_garden/other_garden.dart';

import '../../../styles.dart';
import '../user_viewmodel.dart';

class ProfileCard extends StatelessWidget {
  final UserViewModel user;

  const ProfileCard(this.user, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        OtherGarden.route,
        arguments: user.uid,
      ),
      child: Row(
        children: [
          ClipPath(
            clipper: BlobClipper(id: "6-8-66621"),
            child: Container(
              color: CONTAINER_COLOR,
              width: 170,
              height: 170,
              child: user?.photoURL != null
                  ? Image.network(
                      user.photoURL,
                      fit: BoxFit.fill,
                    )
                  : SvgPicture.asset(
                      "assets/icons/profile.svg",
                      width: 50,
                      height: 50,
                      fit: BoxFit.scaleDown,
                    ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: CONTAINER_RIGHT,
              child: Text(user.nickname, style: TEXT_24),
            ),
          ),
        ],
      ),
    );
  }
}
