import 'package:flutter/material.dart';
import 'package:habit_garden/screens/online/user_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../database.dart';
import '../../navbar.dart';
import '../../styles.dart';
import '../../titlebar.dart';
import 'widgets/profile_card.dart';

class Online extends StatelessWidget {
  static const route = 'online';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar("Online", route),
      backgroundColor: BG_COLOR,
      bottomNavigationBar: NavigationBar(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Selector<Database, Future<Iterable<UserViewModel>>>(
        selector: (_, db) => db.getUsers(),
        builder: (_, usersFuture, __) => FutureBuilder<Iterable<UserViewModel>>(
          initialData: [],
          future: usersFuture,
          builder: (_, users) => ListView(
            children: users.data.map((user) => ProfileCard(user)).toList(),
          ),
        ),
      ),
    );
  }
}
