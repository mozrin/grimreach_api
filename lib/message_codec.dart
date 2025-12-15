import 'dart:convert';
import 'messages.dart';

class MessageCodec {
  String encode(Message message) {
    return jsonEncode({'type': message.type, 'data': message.data});
  }

  Message decode(String jsonString) {
    final Map<String, dynamic> map = jsonDecode(jsonString);
    return Message(
      type: map['type'] as String,
      data: map['data'] as Map<String, dynamic>,
    );
  }
}
