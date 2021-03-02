import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_garden/models/message.dart';

class MessageCloud extends StatelessWidget {
  final Message message;

  const MessageCloud(this.message, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset("assets/cloud.svg"),
          Text(
            message.message,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
