import "dart:convert";

import "package:mongo_dart/mongo_dart.dart";

import "../../../shared.dart";

part "outfit.impl.dart";

/// A class that represents an outfit.
abstract class Outfit extends MongoObject {
  const Outfit._({
    required super.id,
    required this.clothings,
    required this.name,
    required this.userId,
  });

  /// Creates a new [Outfit].
  factory Outfit({
    required ObjectId id,
    required List<Clothing> clothings,
    required String name,
    required String userId,
  }) = _OutfitImpl;

  /// Creates an [Outfit] from a [map].
  factory Outfit.fromMap(Map<String, dynamic> map) = _OutfitImpl.fromMap;

  /// The [Clothing]s of the outfit.
  final List<Clothing> clothings;

  /// The name of the outfit.
  final String name;

  /// The id of the [User] that created the outfit.
  final String userId;

  /// Converts the outfit to a [Map].
  Map<String, dynamic> toMap();

  /// Converts the outfit to a JSON string.
  String toJson();
}
