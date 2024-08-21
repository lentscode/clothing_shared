library;

import "package:mongo_dart/mongo_dart.dart";

export "./clothing/clothing.dart";

abstract class MongoObject {
  const MongoObject({required this.id});

  final ObjectId id;

  String get oid => id.oid;
}
