class User {
  User({
    this.uid,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
  });

  late String? uid;
  final String firstName;
  final String lastName;
  final String mobileNumber;

  Map<String, dynamic> toJSON() {
    return {
      "uid": uid,
      "firstName": firstName,
      "lastName": lastName,
      "mobileNumber": mobileNumber,
    };
  }
}
