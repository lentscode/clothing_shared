library;

import "package:mongo_dart/mongo_dart.dart";

export "./clothing/clothing.dart";
export "./user/user.dart";
export "./outfit/outfit.dart";

abstract class MongoObject {
  const MongoObject({required this.id});

  final ObjectId id;

  String get oid => id.oid;
}
