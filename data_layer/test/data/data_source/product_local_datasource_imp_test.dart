import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task6/core/error/exception.dart';
import 'package:task6/features/product/data/datasources/product_local_datasource_imp.dart';
import 'package:task6/features/product/data/models/product_model.dart';

import '../../helpers/test_helper.mocks.dart';

void main(){
  late ProductLocalDatasourceImp productLocalDatasourceImp;
late MockSharedPreferences mockSharedPreferences;
setUp((){
  mockSharedPreferences =MockSharedPreferences();
  productLocalDatasourceImp=ProductLocalDatasourceImp(sharedPreferences: mockSharedPreferences);
});


 const tProductId = '123';
  const tProductModel = 
  ProductModel(
    id: tProductId,
    name: 'Test Product',
    description: 'Test Description',
    price: 9.99,
    imageUrl: 'https://example.com/product.jpg',
  );
  final tProductModelJson = json.encode(tProductModel.toJson());
group("get last product", (){

  test("return product model form shared preference ", () async{
when(mockSharedPreferences.getString(any))
.thenReturn(tProductModelJson);
final result=  await productLocalDatasourceImp.getLastProduct(tProductId);
expect(result, equals(tProductModel));
  });



  test("throw cacheexception if no value in chache", (){
    when(mockSharedPreferences.getString(any)).thenReturn(null);
    final result=productLocalDatasourceImp.getLastProduct;
     expect(() => result(tProductId), throwsA(isA<CacheException>()));
  });
});


group("cacheProduct", (){

  test("should call sharedpreference to cache the data ", () async{
when(mockSharedPreferences.getString(any))
.thenReturn(tProductModelJson);
final result=  await productLocalDatasourceImp.getAllProducts();
expect(result, equals(tProductModel));
  });



  test("throw cacheexception if no value in chache", (){
    when(mockSharedPreferences.getString(any)).thenReturn(null);
    final result=productLocalDatasourceImp.getLastProduct;
     expect(() => result(tProductId), throwsA(isA<CacheException>()));
  });
});









}