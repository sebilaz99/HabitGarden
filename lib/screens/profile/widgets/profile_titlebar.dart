import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:habit_garden/screens/settings/settings.dart';
import 'package:blobs/blobs.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../auth.dart';
import '../../../styles.dart';

class ProfileTitleBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _ProfileTitleBarState createState() => _ProfileTitleBarState();

  @override
  Size get preferredSize => Size.fromHeight(250);
}

class _ProfileTitleBarState extends State<ProfileTitleBar> {
  final nicknameController = TextEditingController();

  @override
  void dispose() {
    nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SvgPicture.asset(
        'assets/titlebars/profile.svg',
        fit: BoxFit.fill,
        width: double.infinity,
      ),
      SafeArea(
        child: Align(
          alignment: Alignment(0, -0.9),
          child: Text("Profile", style: TEXT_36),
        ),
      ),
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, Settings.route),
        child: SafeArea(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.all(5),
              child: SvgPicture.asset("assets/icons/settings.svg"),
              decoration: CONTAINER_TOP_RIGHT,
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment(0, 0.5),
        child: Consumer<User>(
          builder: (_, user, __) {
            final color = Auth.isLoggedIn(user) ? CONTAINER_COLOR : Colors.grey;
            var nickname = (user?.displayName) ?? "";
            nicknameController.text = nickname;
            return Row(
              children: [
                ClipPath(
                  clipper: BlobClipper(id: "6-8-66621"),
                  child: Container(
                    color: color,
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
                            color: !Auth.isLoggedIn(user)
                                ? Colors.grey[900]
                                : null,
                          ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: CONTAINER_RIGHT.copyWith(color: color),
                    child: TextField(
                      style: TEXT_24,
                      controller: nicknameController,
                      onSubmitted: (name) {
                        GetIt.I<Auth>().changeNickname(name);
                      },
                      enabled: Auth.isLoggedIn(user),
                      cursorColor: DARK_COLOR,
                      decoration: InputDecoration(
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        disabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ]);
  }
}
