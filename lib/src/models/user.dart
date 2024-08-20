part of "models.dart";

abstract class User extends _MongoObject {
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

class _UserImpl extends User {
  const _UserImpl({
    required super.id,
    required super.name,
    required super.email,
    required super.hashPassword,
    required super.salt,
  }) : super._();

  @override
  Map<String, dynamic> toMapComplete() => <String, String>{
        "_id": oid,
        "name": name,
        "email": email,
        "hashPassword": hashPassword,
        "salt": salt,
      };

  @override
  String toJsonPublic() => jsonEncode(<String, String>{
        "_id": oid,
        "name": name,
        "email": email,
      });
}
