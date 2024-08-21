part of "user.dart";

class _UserImpl extends User {
  _UserImpl({
    required super.id,
    required super.name,
    required super.email,
    required super.hashPassword,
    required super.salt,
    super.sessionId,
  }) : super._();

  factory _UserImpl.fromMap(Map<String, dynamic> map) => _UserImpl(
        id: map["id"],
        name: map["name"],
        email: map["email"],
        hashPassword: map["hashPassword"],
        salt: map["salt"],
        sessionId: map["sessionId"],
      );

  @override
  Map<String, dynamic> toMapComplete() => <String, String?>{
        "_id": oid,
        "name": name,
        "email": email,
        "hashPassword": hashPassword,
        "salt": salt,
        "sessionId": sessionId,
      };

  @override
  String toJsonPublic() => jsonEncode(<String, String?>{
        "_id": oid,
        "name": name,
        "email": email,
        "sessioNId": sessionId,
      });
}
