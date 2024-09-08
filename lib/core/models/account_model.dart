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

  String? uid;
  DocumentReference userRef;
  String name;
  String link;
  String login;
  DocumentReference passwordRef;
  String imageUrl;
  List<String> tags;
  bool priority;

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

  factory Account.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data()!;
    try {
      return Account(
        uid: data["uid"]!,
        userRef: data["userRef"]!,
        name: data["name"]!,
        link: data["link"]!,
        login: data["login"]!,
        passwordRef: data["passwordRef"]!,
        imageUrl: data["imageUrl"]!,
        tags: data["tags"]!,
        priority: data["priority"]!,
      );
    } catch (e) {
      print("Error <Account.fromSnapshot> (probably some null value): $e");
      rethrow;
    }
  }
}
