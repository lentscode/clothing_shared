import "dart:convert";

import "package:mongo_dart/mongo_dart.dart";

import "../../../shared.dart";

part "outfit.impl.dart";

abstract class Outfit extends MongoObject {
  const Outfit._({
    required super.id,
    required this.clothes,
    required this.name,
    required this.userId,
  });

  factory Outfit({
    required ObjectId id,
    required List<Clothing> clothes,
    required String name,
    required String userId,
  }) = _OutfitImpl;

  final List<Clothing> clothes;
  final String name;
  final String userId;

  Map<String, dynamic> toMap();
  String toJson();
}
