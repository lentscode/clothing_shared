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
        clothings: (map["clothings"] as List<dynamic>).map<Clothing>((dynamic e) => Clothing.fromMap(e)).toList(),
        name: map["name"],
        userId: map["userId"],
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
}
