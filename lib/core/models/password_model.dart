import 'package:cloud_firestore/cloud_firestore.dart';

class Password {
  Password({
    this.uid,
    required this.accountRef,
    required this.password,
    required this.length,
    required this.numbers,
    required this.symbols,
    required this.lowercase,
    required this.uppercase,
    required this.safety,
  });

  String? uid;
  DocumentReference accountRef;
  String password;
  int length;
  bool numbers;
  bool symbols;
  bool lowercase;
  bool uppercase;
  String safety;

  Map<String, dynamic> toJSON() {
    return {
      "uid": uid,
      "accountRef": accountRef,
      "password": password,
      "length": length,
      "numbers": numbers,
      "symbols": symbols,
      "lowercase": lowercase,
      "uppercase": uppercase,
      "safety": safety,
    };
  }

  factory Password.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data()!;
    try {
      return Password(
        uid: document.reference.id,
        accountRef: data["accountRef"]!,
        password: data["password"]!,
        length: data["length"]!,
        numbers: data["numbers"]!,
        symbols: data["symbols"]!,
        lowercase: data["lowercase"]!,
        uppercase: data["uppercase"]!,
        safety: data["safety"]!,
      );
    } catch (e) {
      print("Error <Password.fromSnapshot> (probably some null value): $e");
      rethrow;
    }
  }
}
