part of "clothing.dart";

class _ClothingImpl extends Clothing {
  const _ClothingImpl({
    required super.id,
    required super.name,
    required super.userId,
    required super.type,
  }) : super._();

  factory _ClothingImpl.fromMap(Map<String, dynamic> map) => _ClothingImpl(
        id: map["_id"],
        name: map["name"],
        userId: map["userId"],
        type: ClothingType.values.firstWhere(
          (ClothingType element) => element.name == map["type"],
        ),
      );

  @override
  String toJson() => jsonEncode(toMap());

  @override
  Map<String, dynamic> toMap() => <String, String>{
        "_id": oid,
        "name": name,
        "userId": userId,
        "type": type.name,
      };
}
