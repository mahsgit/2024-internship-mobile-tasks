import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task6/core/error/exception.dart';
import 'package:task6/core/error/failures.dart';
import 'package:task6/features/product/data/datasources/product_local_datasource.dart';
import 'package:task6/features/product/data/models/product_model.dart';
import 'package:task6/features/product/data/repositories/product_repo_imp.dart';
import 'package:task6/features/product/domain/entities/product.dart';

import '../../helpers/test_helper.mocks.dart';

void main(){
late MockProductRemoteDatasource mockProductRemoteDatasource;
late ProductRepoImp productRepoImpl;
late MockProductLocalDatasource mockProductLocalDatasource;
late MockNetworkInfo mockNetworkInfo;
setUp((){
  mockProductRemoteDatasource=MockProductRemoteDatasource();
  mockProductLocalDatasource=MockProductLocalDatasource();
  mockNetworkInfo=MockNetworkInfo();
  productRepoImpl=ProductRepoImp(
    productRemoteDatasource: mockProductRemoteDatasource,
    productLocalDatasource:mockProductLocalDatasource,
    networkInfo:mockNetworkInfo

    );
});


const testprductmodel=ProductModel(
id: "2", 
name: "name", 
description: "description",
price: 12,
imageUrl: "imageUrl");
const  Product testproductentitiy=testprductmodel;
const testid='1';



group('when network is available  ', () {
  setUp((){
   when(mockNetworkInfo.isconnected).thenAnswer((_) async => true);

  });

group("get current product",() {
  test(
    "should return current product when a call to remote data source is success",
  () async{
    when(mockProductRemoteDatasource.displaySingleProduct(testid))
    .thenAnswer((_) async => testprductmodel);
    final result=await productRepoImpl.display_single_product_repo(testid);
    expect(result, equals(const Right(testproductentitiy)));
  });




   test(
    "should return server failure ",
  () async{
    when(mockProductRemoteDatasource.displaySingleProduct(testid))
    .thenThrow(ServerException());
    final result=await productRepoImpl.display_single_product_repo(testid);
    expect(result, equals(const Left(ServerFailure('An error has occured'))));
  });

  test(
    "should return connection failure ",
  () async{
    when(mockProductRemoteDatasource.displaySingleProduct(testid))
    .thenThrow(SocketException("Failed to connect"));
    final result=await productRepoImpl.display_single_product_repo(testid);
    expect(result, equals(const Left(ConnectionFailure('Failed to connect'))));
  });



});



});



group('when network is not available  ', () {
  setUp((){
   when(mockNetworkInfo.isconnected).thenAnswer((_) async => false);

  });

group("get current product from local ",() {
  test(
    "should return current product when a call to local data source is success",
  () async{
    when(mockProductLocalDatasource.getLastProduct(testid))
    .thenAnswer((_) async => testprductmodel);
    final result=await productRepoImpl.display_single_product_repo(testid);
    expect(result,  Right(testproductentitiy));
    verify(mockProductLocalDatasource.getLastProduct(testid));
    
  });




   test(
    "should return cache failure ",
  () async{
    when(mockProductLocalDatasource.getLastProduct(testid))
    .thenThrow(CacheException(message: 'An error has occured'));
    final result=await productRepoImpl.display_single_product_repo(testid);
    expect(result, equals(const Left(CacheFailure('An error has occured'))));
  });






});



});








}