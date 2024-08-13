import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/product.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/product_repo.dart';
import '../datasources/product_local_datasource.dart';
import '../datasources/product_remote_datasource_abstract.dart';
import '../models/product_model.dart';

class ProductRepoImp extends ProductRepo{
  final ProductRemoteDatasource productRemoteDatasource;
  final ProductLocalDatasource productLocalDatasource;
  final NetworkInfo networkInfo;

  ProductRepoImp({
     required this.productRemoteDatasource,
     required this.productLocalDatasource,
     required this.networkInfo, });


  @override
  Future<Either<Failure, Product>> display_single_product_repo(String id) async {
    if (await networkInfo.isconnected){
     try{
      final result=await productRemoteDatasource.displaySingleProduct(id);
      productLocalDatasource.cachProduct(result);
      return Right(result.toEntity());
     }on ServerException{
      return  const Left(ServerFailure("An error has occured"));
     }on SocketException{
      return const Left(ConnectionFailure("Failed to connect"));}
  } else{
    try{
      final result =await productLocalDatasource.getLastProduct(id);
      return Right(result);
    }on CacheException catch(e){
      return Left(CacheFailure(e.message));
    }}}





  @override
  Future<Either<Failure, Unit>> delete_repo(String id) async  {
if (await networkInfo.isconnected){
  try{
  await productRemoteDatasource.deleteProduct(id);
  productLocalDatasource.deleteProduct(id);
  return const Right(unit);
}on ServerException catch(e){
  return Left(ServerFailure("server Failure"));}
}else{
  return Left(NetworkFailure());}}







  @override
  Future<Either<Failure, List<Product>>> display_all_product_repo() async {
   if( await networkInfo.isconnected){
    try{
      final result =await productRemoteDatasource.displayAllProducts();
      productLocalDatasource.cachProducts(result);
      return Right(result);
       }on ServerException catch (e){
        return Left(ServerFailure("server Failure"));
       }}
       else{
          try{
          final result =  await productLocalDatasource.getAllProducts();
          return Right(result);
          }on CacheException catch(e){
            return Left(CacheFailure(e.message));
          }}}

  

  @override
  Future<Either<Failure, Product>> update_product_repo(Product product) async {
  if (await networkInfo.isconnected){
    try{
    final result =await productRemoteDatasource.updateProduct(product.toModel());
    productLocalDatasource.cachProduct(product.toModel());
    return Right(result);
    }on ServerException catch (e){
      return Left(ServerFailure("server Failure"));
    }}else{
      return Left(NetworkFailure());}}
  



  @override
  Future<Either<Failure, Product>> add_product_repo(Product product) async {
    final prodictModel=product.toModel();
   if (await networkInfo.isconnected){
    try{
      await productRemoteDatasource.addProduct(prodictModel);
      productLocalDatasource.cachProduct(prodictModel);
      return Right(product);
    }on ServerException catch(e){
      return Left(ServerFailure("server failure"));}
    }else{
      return const Left(NetworkFailure());
    }}} 