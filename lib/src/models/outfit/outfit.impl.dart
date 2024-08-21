part of "outfit.dart";

class _OutfitImpl extends Outfit {
  const _OutfitImpl({
    required super.id,
    required super.clothes,
    required super.name,
    required super.userId,
  }) : super._();

  @override
  String toJson() => jsonEncode(toMap());

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        "_id": oid,
        "clothes": clothes.map((Clothing clothing) => clothing.toMap()).toList(),
        "name": name,
        "userId": userId,
      };
}
