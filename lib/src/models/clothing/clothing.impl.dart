part of "clothing.dart";

class _ClothingImpl extends Clothing {
  const _ClothingImpl({
    required super.id,
    required super.name,
    required super.userId,
    required super.type,
    required super.color,
    required super.lastUpdate,
    super.brand,
    super.imageUrl,
    super.imageExpiration,
  }) : super._();

  factory _ClothingImpl.create({
    required String name,
    required ObjectId userId,
    required ClothingType type,
    required String color,
    String? brand,
    String? imageUrl,
    File? image,
    DateTime? imageExpiration,
  }) =>
      _ClothingImpl(
        id: ObjectId(),
        name: name,
        userId: userId,
        type: type,
        color: color,
        brand: brand,
        imageUrl: imageUrl,
        lastUpdate: DateTime.now(),
        imageExpiration: imageExpiration,
      );

  factory _ClothingImpl.fromMap(Map<String, dynamic> map) => _ClothingImpl(
        id: map["_id"] is String ? ObjectId.parse(map["_id"]) : map["_id"],
        name: map["name"],
        userId: map["userId"] is String
            ? ObjectId.parse(map["userId"])
            : map["userId"],
        type: ClothingType.values.firstWhere(
          (ClothingType element) => element.name == map["type"],
        ),
        color: map["color"],
        brand: map["brand"],
        imageUrl: map["imageUrl"],
        lastUpdate: DateTime.parse(map["lastUpdate"]),
        imageExpiration: map["imageExpiration"] != null
            ? DateTime.parse(map["imageExpiration"])
            : null,
      );

  @override
  String? get imageUrl {
    if (_imageUrl == null || imageExpiration == null) {
      return null;
    } else if (imageExpiration!.isBefore(DateTime.now())) {
      return null;
    }
    return _imageUrl;
  }

  @override
  String toJson() => jsonEncode(toMap());

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        "_id": oid,
        "name": name,
        "userId": userId.oid,
        "type": type.name,
        "color": color,
        "brand": brand,
        "imageUrl": _imageUrl,
        "lastUpdate": lastUpdate,
        "imageExpiration": imageExpiration,
      };

  @override
  Map<String, dynamic> toMongo() => <String, dynamic>{
        "_id": id,
        "name": name,
        "userId": userId.oid,
        "type": type.name,
        "color": color,
        "brand": brand,
        "imageUrl": _imageUrl,
        "lastUpdate": lastUpdate,
        "imageExpiration": imageExpiration,
      };

  @override
  Clothing copyWith({
    String? name,
    ClothingType? type,
    String? color,
    String? brand,
    DateTime? lastUpdate,
    String? imageUrl,
    File? image,
    bool nullifyBrand = false,
    DateTime? imageExpiration,
  }) =>
      Clothing(
        id: id,
        name: name ?? this.name,
        userId: userId,
        type: type ?? this.type,
        color: color ?? this.color,
        brand: brand ?? (nullifyBrand ? null : this.brand),
        imageUrl: imageUrl ?? _imageUrl,
        lastUpdate: lastUpdate ?? this.lastUpdate,
        imageExpiration: imageExpiration ?? this.imageExpiration,
      );
}
