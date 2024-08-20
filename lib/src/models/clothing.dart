part of "models.dart";

abstract class Clothing extends _MongoObject {
  const Clothing._({
    required super.id,
    required this.name,
    required this.userId,
    required this.type,
  });

  factory Clothing({
    required ObjectId id,
    required String name,
    required String userId,
    required ClothingType type,
  }) = _ClothingImpl;

  final String name;
  final String userId;
  final ClothingType type;

  Map<String, dynamic> toMap();
  String toJson();
}

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

enum ClothingType {
  shirt("shirt");

  const ClothingType(this.name);

  final String name;
}
