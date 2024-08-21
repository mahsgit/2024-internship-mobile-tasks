import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../../core/constants/constants.dart';
import '../../../login_and_registration/data/data_source/localtoken.dart';
import '../models/product_model.dart';
import 'product_remote_datasource_abstract.dart';

class ProductRemoteDatasourceImpl extends ProductRemoteDatasource {
  final http.Client client;
  final LocalToken localToken;

  ProductRemoteDatasourceImpl({
    required this.localToken,
    required this.client,
  });

  @override
  Future<ProductModel> addProduct(ProductModel product) async {
    final String apiUrl = Urls.addProductUrl();
    try {
      File file = File(product.imageUrl);
      var exists = await file.exists();
      if (!exists) {
        throw Exception("Image file does not exist.");
      }

      var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
        ..files.add(
          await http.MultipartFile.fromPath(
            'image',
            file.path,
            contentType: MediaType('image', 'jpg'),
          ),
        )
        ..fields['id'] = product.id
        ..fields['name'] = product.name
        ..fields['price'] = product.price.toString()
        ..fields['description'] = product.description;

      // Add headers with token
      request.headers.addAll(await _getAuthHeader());

      var response = await client.send(request);

      if (response.statusCode == 201) {
        final responseBody = await response.stream.bytesToString();
        final data = json.decode(responseBody);
        return ProductModel.fromJson(data);
      } else {
        final responseBody = await response.stream.bytesToString();
        final data = json.decode(responseBody);
        throw Exception("Failed to add product: $data");
      }
    } catch (e) {
      throw Exception('Error adding product: $e');
    }
  }

  @override
  Future<List<ProductModel>> displayAllProducts() async {
    final response = await client.get(
      Uri.parse(Urls.displayAllProductsUrl()),
      headers: await _getAuthHeader(), // Use the helper method to add headers
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Future<ProductModel> displaySingleProduct(String id) async {
    final response = await client.get(
      Uri.parse(Urls.displaySingleProductUrl(id)),
      headers: await _getAuthHeader(), // Use the helper method to add headers
    );

    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product');
    }
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    final token = await localToken.getToken();

    final response = await client.put(
      Uri.parse(Urls.updateProductUrl(product.id)),
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
      body: json.encode(product.toJson()),
    );

    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update product');
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    final response = await client.delete(
      Uri.parse(Urls.deleteProductUrl(id)),
      headers: await _getAuthHeader(), // Use the helper method to add headers
    );

    if (response.statusCode != 204 && response.statusCode != 200) {
      throw Exception('Failed to delete product');
    }
  }

  // Helper method to build authentication headers
  Future<Map<String, String>> _getAuthHeader() async {
    final token = await localToken.getToken();
    final headers = <String, String>{};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }
}
