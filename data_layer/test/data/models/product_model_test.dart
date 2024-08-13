import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:task6/features/product/data/models/product_model.dart';
import 'package:task6/features/product/domain/entities/product.dart';
import '../../helpers/json_reader.dart';

void main() {
  const testProductModel = ProductModel(
    id: "6672776eb905525c145fe0bb", // Updated ID to match actual data
    name: "Anime website",
    description: "Explore anime characters.",
    price: 123.0,
    imageUrl: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg", // Updated URL to match actual data
  );

  const testProductJson = {
    "id": "6672776eb905525c145fe0bb", // Updated ID to match actual data
    "name": "Anime website",
    "description": "Explore anime characters.",
    "price": 123.0,
    "imageUrl": "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg" // Updated URL to match actual data
  };

  test("should be a subclass of Product entity", () async {
    expect(testProductModel, isA<Product>());
  });

  test("should return a valid model from json", () async {
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('helpers/dummy_data/dummy_product_response.json'),
    );

    final Map<String, dynamic> productJson = jsonMap['data'];
    final ProductModel product = ProductModel.fromJson(productJson);

    // Verify the parsed product model
    expect(product.id, testProductModel.id);
    expect(product.name, testProductModel.name);
    expect(product.description, testProductModel.description);
    expect(product.price, testProductModel.price);
    expect(product.imageUrl, testProductModel.imageUrl);
  });

  test("should return a valid json from model", () async {
    // Act
    final result = testProductModel.toJson();

    // Assert
    expect(result, equals(testProductJson));
  });
}
