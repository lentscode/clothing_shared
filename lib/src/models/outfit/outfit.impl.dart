part of "outfit.dart";

class _OutfitImpl extends Outfit {
  const _OutfitImpl({
    required super.id,
    required super.clothings,
    required super.name,
    required super.userId,
  }) : super._();

  factory _OutfitImpl.fromMap(Map<String, dynamic> map) => _OutfitImpl(
        id: map["_id"],
        clothings: map["clothings"] ,
        name: map["name"],
        userId: ObjectId.parse(map["userId"]),
      );

  factory _OutfitImpl.create({
    required List<Clothing> clothings,
    required String name,
    required ObjectId userId,
  }) =>
      _OutfitImpl(
        id: ObjectId(),
        clothings: clothings,
        name: name,
        userId: userId,
      );

  @override
  String toJson() => jsonEncode(toMap());

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        "_id": oid,
        "clothings": clothings.map((Clothing clothing) => clothing.toMap()).toList(),
        "name": name,
        "userId": userId,
      };

  @override
  Map<String, dynamic> toMongo() => <String, dynamic>{
        "_id": id,
        "clothings": clothings.map((Clothing clothing) => clothing.oid).toList(),
        "name": name,
        "userId": userId.oid,
      };
}
