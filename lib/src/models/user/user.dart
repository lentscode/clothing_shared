import "dart:convert";

import "../../../shared.dart";

part "user.impl.dart";

/// A class that represents a user.
abstract class User extends MongoObject {
  User._({
    required super.id,
    required this.email,
    required this.hashPassword,
    required this.salt,
    this.name,
    this.sessionId,
  });

  /// Creates a new [User].
  factory User({
    required ObjectId id,
    required String email,
    required String hashPassword,
    required String salt,
    String? name,
    String? sessionId,
  }) = _UserImpl;

  /// Creates a new [User] with a new [ObjectId].
  factory User.create({
    required String email,
    required String hashPassword,
    required String salt,
    String? name,
    String? sessionId,
  }) =>
      _UserImpl(
        id: ObjectId(),
        name: name,
        email: email,
        hashPassword: hashPassword,
        salt: salt,
      );

  /// Creates a [User] from a [map].
  factory User.fromMap(Map<String, dynamic> map) => _UserImpl.fromMap(map);

  /// The name of the user.
  final String? name;

  /// The email of the user.
  final String email;

  /// The password of the user, hashed.
  final String hashPassword;

  /// The salt used to hash the password.
  final String salt;

  /// The session id of the user.
  ///
  /// This is created when the user logs in.
  String? sessionId;

  /// Converts the [User] to a [Map].
  ///
  /// It stores all the fields of the [User] in the [Map].
  Map<String, dynamic> toMapComplete();

  /// Converts the [User] to a JSON string.
  ///
  /// Only the non-sensitive fields are stored in the JSON string.
  String toJsonPublic();
}
