import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/constants/constants.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDatasource {
  Future<ProductModel> display_single_product_repo(String id);
}

class ProductRemoteDatasourceImple extends ProductRemoteDatasource {
  final http.Client client;

  ProductRemoteDatasourceImple({required this.client});

  @override
  Future<ProductModel> display_single_product_repo(String id) async {
    final response = await client.get(Uri.parse(Urls.displaySingleProductUrl(id)));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'];
      return ProductModel.fromJson(data);
    } else {
      throw Exception('Failed to load product');
    }
  }
}
