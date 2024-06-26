import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  Account({
    this.uid,
    required this.userRef,
    required this.name,
    required this.link,
    required this.login,
    required this.passwordRef,
    required this.imageUrl,
    required this.tags,
    required this.priority,
  });

  late String? uid;
  final DocumentReference userRef;
  final String name;
  final String link;
  final String login;
  final DocumentReference passwordRef;
  final String imageUrl;
  final List<String> tags;
  final bool priority;

  Map<String, dynamic> toJSON() {
    return {
      "uid": uid,
      "userRef": userRef,
      "name": name,
      "link": link,
      "login": login,
      "passwordRef": passwordRef,
      "imageUrl": imageUrl,
      "tags": tags,
      "priority": priority,
    };
  }
}
