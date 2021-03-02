import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../auth.dart';
import '../../styles.dart';
import '../../titlebar.dart';

class Settings extends StatelessWidget {
  static const route = "settings";

  Widget buildLoginButton(String provider, VoidCallback onTap) {
    bool isLinked = GetIt.I<Auth>().isLinked(provider + ".com");
    return GestureDetector(
      child: Container(
        padding: isLinked ? EdgeInsets.all(5) : null,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isLinked ? GRASS_COLOR : null,
        ),
        child: SvgPicture.asset("assets/icons/$provider.svg", width: 70),
      ),
      onTap: onTap,
    );
  }

  Widget buildButton(String text, VoidCallback onTap,
          [Color textColor, Color boxColor]) =>
      GestureDetector(
        child: Container(
          width: 250,
          height: 70,
          alignment: Alignment.center,
          decoration: CONTAINER_MIDDLE.copyWith(color: boxColor),
          child: Text(text, style: TEXT_24.copyWith(color: textColor)),
        ),
        onTap: onTap,
      );

  @override
  Widget build(BuildContext context) {
    final hasProvider = GetIt.I<Auth>().hasProvider();
    return Scaffold(
      backgroundColor: BG_COLOR,
      appBar: TitleBar("Settings", route),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildLoginButton("google", () async {
                    await GetIt.I<Auth>().toggleProvider("google.com");
                    Navigator.pop(context);
                  }),
                  buildLoginButton("facebook", () async {
                    await GetIt.I<Auth>().toggleProvider("facebook.com");
                    Navigator.pop(context);
                  }),
                  buildLoginButton("twitter", () async {
                    await GetIt.I<Auth>().toggleProvider("twitter.com");
                    Navigator.pop(context);
                  }),
                ],
              ),
            ),
            buildButton(
              "Sign out",
              hasProvider
                  ? () {
                      GetIt.I<Auth>().signOut();
                      Navigator.pop(context);
                    }
                  : null,
              !hasProvider ? Colors.grey[900] : null,
              !hasProvider ? Colors.grey : null,
            ),
            buildButton(
              "Feedback",
              () => launch(
                  "mailto:taae0094@scs.ubbcluj.ro?subject=Habit%20Garden%20feedback"),
            ),
            buildButton(
              "Help",
              () => launch(
                  "https://andrei-toterman.github.io/habit-garden/"),
            ),
            buildButton(
              "Delete",
              () {
                GetIt.I<Auth>().deleteAccount();
                Navigator.pop(context);
              },
              Colors.white,
              RED,
            ),
          ],
        ),
      ),
    );
  }
}
