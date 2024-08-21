import "dart:convert";

import "package:mongo_dart/mongo_dart.dart";
import "../../../shared.dart";

part "user.impl.dart";

abstract class User extends MongoObject {
  const User._({
    required super.id,
    required this.name,
    required this.email,
    required this.hashPassword,
    required this.salt,
  });

  factory User({
    required ObjectId id,
    required String name,
    required String email,
    required String hashPassword,
    required String salt,
  }) = _UserImpl;

  final String name;
  final String email;
  final String hashPassword;
  final String salt;

  Map<String, dynamic> toMapComplete();
  String toJsonPublic();
}
