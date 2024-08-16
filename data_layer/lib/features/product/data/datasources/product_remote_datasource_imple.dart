import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'dart:ui';

import 'package:http/http.dart';

import '../../../../core/constants/constants.dart';
import '../models/product_model.dart';
import 'product_remote_datasource_abstract.dart';



import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';


// so all this is the implemetation of actually interactic with the api


class ProductRemoteDatasourceImpl extends ProductRemoteDatasource {
  // used to make http request 
  final http.Client client;
// the constructor need client
  ProductRemoteDatasourceImpl({required this.client});


  @override
  Future<ProductModel> addProduct(ProductModel product) async{
    final String apiUrl= Urls.addProductUrl();
    try {
      File file=File(product.imageUrl);
      var exist=await file.exists();
      if (!exist){
        throw Exception("image file does not exist.");
      }


      var request= http.MultipartRequest('POST',Uri.parse(apiUrl));
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
           file.path,
           contentType: MediaType('image', 'jpg'),
           ));

           request.fields['id']=product.id;
           request.fields['name']=product.name;
           request.fields['price']=product.price.toString();
           request.fields['description']=product.description;


           var respons= await client.send(request);

           if (respons.statusCode==201){
            final responseBody = await respons.stream.bytesToString();
            final data = json.decode(responseBody);
            return ProductModel.fromJson(data);
           }else{
            final responseBody= await respons.stream.bytesToString();
            final data=json.decode(responseBody);
            throw Exception(
              "Failed to add product $data"
            );
           }
    }catch(e){
      throw Exception('error adding product: $e');
    }

  }

  @override
  Future<List<ProductModel>> displayAllProducts() async {
    final response = await client.get(Uri.parse(Urls.displayAllProductsUrl()));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }


  @override
  Future<ProductModel> displaySingleProduct(String id) async {
    final response = await client.get(Uri.parse(Urls.displaySingleProductUrl(id)));

    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product');
    }
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    final response = await client.put(
      Uri.parse(Urls.updateProductUrl(product.id)),
      headers: {'Content-Type': 'application/json'},
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
    final response = await client.delete(Uri.parse(Urls.deleteProductUrl(id)));

    if (response.statusCode != 204 && response.statusCode !=200) {
      throw Exception('Failed to delete product');
    }
  }
}
