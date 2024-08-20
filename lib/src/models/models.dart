library;

import "dart:convert";

import "package:mongo_dart/mongo_dart.dart";

part "clothing.dart";
part "outfit.dart";
part "user.dart";

abstract class _MongoObject {
  const _MongoObject({required this.id});

  final ObjectId id;

  String get oid => id.oid;
}
