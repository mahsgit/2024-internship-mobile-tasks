import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
import '../../domain/entities/product.dart';
import '../models/product_model.dart';
import 'product_local_datasource.dart';

class ProductLocalDatasourceImp implements ProductLocalDatasource{
final SharedPreferences sharedPreferences;
//{} named parameter when we call the construct we have to 
// shared..: then pass not like positional
ProductLocalDatasourceImp({required  this.sharedPreferences});


  @override
  Future<void> cachProduct(ProductModel productCache)async {
    final jsonString=json.encode(productCache.toJson());
    await sharedPreferences.setString(productCache.id, jsonString);
  }





  @override
  Future<ProductModel> getLastProduct(String id) async{
    final jsonString= sharedPreferences.getString(id);
    if (jsonString !=null){
      return Future.value(ProductModel.fromJson(json.decode(jsonString)));
    }else{
      throw CacheException(message: "no chached product");
      
    }
  }
  




  @override
  Future<void> cachProducts(List<ProductModel> products) async {
    final Map<String, String> jsonMap={
      for(var product in products) product.id:json.encode(product.toJson())
    };
    await sharedPreferences.setString(
      'CACHED_PRODUCTS', json.encode(jsonMap));
  }



  
  @override
  Future<void> deleteProduct(String id) async {
    final success=await sharedPreferences.remove(id);
    if(!success){
      throw CacheException(message: "Failed to delete product with id:$id ");
    }

  }
  
  @override
  Future<List<ProductModel>> getAllProducts() async {
    final jsonstring =sharedPreferences.getString('CACHED_PRODUCTS');
    if (jsonstring !=null){
      final Map<String,dynamic> jsonMap=json.decode(jsonstring);
      final List<ProductModel> products=
      jsonMap.values.map((jsonstring)=>ProductModel.fromJson(json.decode(jsonstring))).toList();
      return Future.value(products);
    }else{
      throw CacheException(message: "no cached products found ");

    }

   
  }
  
}