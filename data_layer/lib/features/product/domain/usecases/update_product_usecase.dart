import 'package:dartz/dartz.dart';
import 'package:flutter/gestures.dart';
import 'package:task6/core/error/failures.dart';
import 'package:task6/core/usecases/usecase.dart';
import 'package:task6/features/product/domain/entities/product.dart';
import 'package:task6/features/product/domain/repositories/product_repo.dart';

class UpdateProductUsecase extends Usecase<Product, Product>{

  ProductRepo repository;
  UpdateProductUsecase(this.repository);
  @override
 Future<Either<Failure, Product>> call(Product params) async{
 return await repository.update_product_repo(params);
 }
}