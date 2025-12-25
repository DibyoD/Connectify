import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String name;
  final String senderID;
  final String senderEmail;
  final String receiverID;
  final String message;
  final String image;
  final Timestamp timestamp;

  Message(  {
    required this.name,
    required this.senderID,
    required this.senderEmail,
    required this.receiverID,
    required this.message,
    required this.image,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'name' : name,
      'senderID': senderID,
      'senderEmail': senderEmail,
      'receiverID': receiverID,
      'message': message,
      "image" : image,
      'timestamp': timestamp,
    };
  }
}
