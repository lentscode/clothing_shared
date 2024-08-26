import "dart:convert";
import "dart:io";

import "../../../shared.dart";

part "clothing.impl.dart";

/// A class that represents a piece of clothing.
abstract class Clothing extends MongoObject {
  const Clothing._({
    required super.id,
    required this.name,
    required this.userId,
    required this.type,
    required this.color,
    required this.lastUpdate,
    this.brand,
    String? imageUrl,
    this.imageExpiration,
  }) : _imageUrl = imageUrl;

  /// Creates a new [Clothing].
  factory Clothing({
    required ObjectId id,
    required String name,
    required ObjectId userId,
    required ClothingType type,
    required String color,
    required DateTime lastUpdate,
    String? brand,
    String? imageUrl,
    DateTime? imageExpiration,
  }) = _ClothingImpl;

  factory Clothing.create({
    required String name,
    required ObjectId userId,
    required ClothingType type,
    required String color,
    String? brand,
    String? imageUrl,
    DateTime? imageExpiration,
  }) = _ClothingImpl.create;

  /// Creates a [Clothing] from a [map].
  factory Clothing.fromMap(Map<String, dynamic> map) = _ClothingImpl.fromMap;

  /// The name of the [Clothing].
  final String name;

  /// The id of the [User] that created the [Clothing].
  final ObjectId userId;

  /// The type of the [Clothing].
  final ClothingType type;

  final String color;

  final String? brand;

  final String? _imageUrl;

  final DateTime lastUpdate;

  final DateTime? imageExpiration;

  String? get imageUrl;

  /// Converts the [Clothing] to a [Map].
  Map<String, dynamic> toMap();

  Map<String, dynamic> toMongo();

  /// Converts the [Clothing] to a JSON string.
  String toJson();

  Clothing copyWith({
    String? name,
    ClothingType? type,
    String? color,
    String? brand,
    bool nullifyBrand = false,
    String? imageUrl,
    File? image,
    DateTime? lastUpdate,
    DateTime? imageExpiration,
  });
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

extension ClothingList on List<Clothing> {
  String toJson() =>
      jsonEncode(map((Clothing clothing) => clothing.toMap()).toList());
}
