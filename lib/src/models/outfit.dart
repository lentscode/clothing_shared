part of "models.dart";

abstract class Outfit extends _MongoObject {
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
    "clothes": clothes.map((clothing) => clothing.toMap()).toList(),
    "name": name,
    "userId": userId,
  };
}
