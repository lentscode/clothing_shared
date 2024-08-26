import "package:faker/faker.dart";
import "package:shared/shared.dart";
import "package:test/test.dart";

void main() {
  late ObjectId id;
  late String name;
  late ObjectId userId;
  late ClothingType type;
  late String color;
  late Map<String, dynamic> map;
  late String imageUrl;
  late String brand;

  setUp(() {
    id = ObjectId();
    name = "name";
    userId = ObjectId();
    type = Faker().randomGenerator.element(ClothingType.values);
    color = "white";
    imageUrl = "imageUrl";
    brand = "brand";
    map = <String, Object>{
      "_id": id,
      "name": name,
      "userId": userId,
      "type": type.name,
      "color": color,
      "lastUpdate": DateTime.now(),
    };
  });

  group("Clothing", () {
    test("Default constructor: should return a Clothing object", () {
      final Clothing clothing = Clothing(
        id: id,
        name: name,
        userId: userId,
        type: type,
        color: color,
        lastUpdate: DateTime.now(),
      );

      expect(clothing.name, name);
      expect(clothing.type, type);
      expect(clothing.userId, userId);
      expect(clothing.id, id);
      expect(clothing.color, color);
      expect(clothing.brand, isNull);
      expect(clothing.imageExpiration, isNull);
      expect(clothing.imageUrl, isNull);
      expect(clothing.lastUpdate, isA<DateTime>());
    });

    group("fromMap()", () {
      test("should return a Clothing object", () {
        final Clothing clothing = Clothing.fromMap(map);

        expect(clothing.name, name);
        expect(clothing.type, type);
        expect(clothing.userId, userId);
        expect(clothing.id, id);
        expect(clothing.color, color);
        expect(clothing.brand, isNull);
        expect(clothing.imageExpiration, isNull);
        expect(clothing.imageUrl, isNull);
        expect(clothing.lastUpdate, isA<DateTime>());
      });
    });

    group("create()", () {
      test("Success: should return a Clothing object", () {
        final Clothing clothing = Clothing.create(
          name: name,
          userId: userId,
          type: type,
          color: color,
        );

        expect(clothing.name, name);
        expect(clothing.type, type);
        expect(clothing.userId, userId);
        expect(clothing.id, isA<ObjectId>());
        expect(clothing.color, color);
        expect(clothing.brand, isNull);
        expect(clothing.imageExpiration, isNull);
        expect(clothing.imageUrl, isNull);
        expect(clothing.lastUpdate, isA<DateTime>());
      });
    });

    group("get imageUrl", () {
      test(
          "Success: if imageUrl is not null and imageExpiration is after DateTime.now(), should return the imageUrl",
          () {
        final Clothing clothing = Clothing(
          id: id,
          name: name,
          userId: userId,
          type: type,
          color: color,
          lastUpdate: DateTime.now().add(const Duration(seconds: 10)),
          imageExpiration: DateTime.now().add(const Duration(seconds: 10)),
          imageUrl: imageUrl,
        );

        expect(clothing.imageUrl, imageUrl);
      });

      test("Failure: if imageUrl is null, should return null", () {
        final Clothing clothing = Clothing(
          id: id,
          name: name,
          userId: userId,
          type: type,
          color: color,
          lastUpdate: DateTime.now(),
          imageExpiration: DateTime.now().add(const Duration(seconds: 10)),
        );

        expect(clothing.imageUrl, isNull);
      });

      test("Failure: if imageExpiration is null, should return null", () {
        final Clothing clothing = Clothing(
          id: id,
          name: name,
          userId: userId,
          type: type,
          color: color,
          lastUpdate: DateTime.now(),
          imageUrl: imageUrl,
        );

        expect(clothing.imageUrl, isNull);
      });

      test(
          "Failure: if imageExpiration is before DateTime.now(), should return null",
          () {
        final Clothing clothing = Clothing(
          id: id,
          name: name,
          userId: userId,
          type: type,
          color: color,
          lastUpdate: DateTime.now(),
          imageUrl: imageUrl,
          imageExpiration: DateTime.now().subtract(const Duration(seconds: 1)),
        );

        expect(clothing.imageUrl, isNull);
      });
    });

    group("toMap()", () {
      test("Success: should return a Map with all fields", () {
        final Clothing clothing = Clothing(
          id: id,
          name: name,
          userId: userId,
          type: type,
          color: color,
          brand: brand,
          lastUpdate: DateTime.now(),
          imageUrl: imageUrl,
          imageExpiration: DateTime.now().subtract(const Duration(seconds: 1)),
        );

        final Map<String, dynamic> map = clothing.toMap();

        expect(map["_id"], isA<String>());
        expect(map["userId"], isA<String>());
        expect(map["name"], name);
        expect(map["type"], type.name);
        expect(map["color"], color);
        expect(map["brand"], brand);
        expect(map["imageUrl"], imageUrl);
        expect(map["imageExpiration"], isA<DateTime>());
        expect(map["lastUpdate"], isA<DateTime>());
      });
    });

    group("toJson()", () {});
  });
}
