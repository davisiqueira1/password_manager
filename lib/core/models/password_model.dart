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

  late String? uid;
  final DocumentReference accountRef;
  final String password;
  final int length;
  final bool numbers;
  final bool symbols;
  final bool lowercase;
  final bool uppercase;
  final String safety;

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
}
