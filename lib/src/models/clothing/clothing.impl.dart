part of "clothing.dart";

class _ClothingImpl extends Clothing {
  const _ClothingImpl({
    required super.id,
    required super.name,
    required super.userId,
    required super.type,
  }) : super._();

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
