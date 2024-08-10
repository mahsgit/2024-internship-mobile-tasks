import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:task6/core/error/failures.dart';
import 'package:task6/core/usecases/usecase.dart';
import 'package:task6/features/product/domain/entities/product.dart';
import 'package:task6/features/product/domain/repositories/product_repo.dart';

class ViewAllProductsUsecase extends Usecase<List<Product>,NoParams >{

  final ProductRepo repository;
  ViewAllProductsUsecase(this.repository);
  
  @override
  Future<Either<Failure,List<Product>>> call(NoParams params) async{
    return  await repository.display_all_product_repo();
  }



}