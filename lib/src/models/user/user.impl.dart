part of "user.dart";

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
