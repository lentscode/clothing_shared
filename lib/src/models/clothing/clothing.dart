import "dart:convert";

import "package:mongo_dart/mongo_dart.dart";

import "../../../shared.dart";

part "clothing.impl.dart";

/// A class that represents a piece of clothing.
abstract class Clothing extends MongoObject {
  const Clothing._({
    required super.id,
    required this.name,
    required this.userId,
    required this.type,
  });

  /// Creates a new [Clothing].
  factory Clothing({
    required ObjectId id,
    required String name,
    required String userId,
    required ClothingType type,
  }) = _ClothingImpl;

  /// Creates a [Clothing] from a [map].
  factory Clothing.fromMap(Map<String, dynamic> map) = _ClothingImpl.fromMap;

  /// The name of the [Clothing].
  final String name;

  /// The id of the [User] that created the [Clothing].
  final String userId;

  /// The type of the [Clothing].
  final ClothingType type;

  /// Converts the [Clothing] to a [Map].
  Map<String, dynamic> toMap();
  /// Converts the [Clothing] to a JSON string.
  String toJson();
}

//TODO: ADD MORE CLOTHING TYPES
/// An enum that represents the type of a piece of clothing.
enum ClothingType {
  /// A shirt.
  shirt("shirt");

  const ClothingType(this.name);

  /// The name of the [ClothingType].
  final String name;
}
