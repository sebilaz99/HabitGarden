import 'package:habit_garden/screens/message/messave_viewmodel.dart';

class Message {
  final String message;
  final DateTime timestamp;

  Message(this.message, this.timestamp);

  Message.fromViewModel(MessageViewModel message)
      : this(message.message, DateTime.now());

  Message.fromJson(Map<String, dynamic> json)
      : this(
          json["message"] as String,
          DateTime.parse(json["timestamp"] as String),
        );

  Map<String, dynamic> toJson() => {
        "message": message,
        "timestamp": timestamp?.toIso8601String(),
      };
}
