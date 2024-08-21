import "dart:convert";

import "package:mongo_dart/mongo_dart.dart";
import "../../../shared.dart";

part "clothing.impl.dart";

abstract class Clothing extends MongoObject {
  const Clothing._({
    required super.id,
    required this.name,
    required this.userId,
    required this.type,
  });

  factory Clothing({
    required ObjectId id,
    required String name,
    required String userId,
    required ClothingType type,
  }) = _ClothingImpl;

  final String name;
  final String userId;
  final ClothingType type;

  Map<String, dynamic> toMap();
  String toJson();
}

//TODO: ADD MORE CLOTHING TYPES
enum ClothingType {
  shirt("shirt");

  const ClothingType(this.name);

  final String name;
}
