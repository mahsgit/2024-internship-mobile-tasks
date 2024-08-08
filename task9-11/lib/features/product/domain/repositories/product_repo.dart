import 'package:dartz/dartz.dart';
import 'package:task6/core/error/failures.dart';
import 'package:task6/features/product/domain/entities/product.dart';


abstract class ProductRepo{
  //the entity and the failure this is just abstrac the impelemtation is in data repository with deals with 
  // backend 
  Future<Either<Failure,Product>>add_product_repo(Product product);
  Future<Either<Failure,List<Product>>>display_all_product_repo();
  Future<Either<Failure,Product>>display_single_product_repo(String id);
  Future<Either<Failure,Product>>update_product_repo(Product product);
  //no product to return  and since the user delete by UI we send id 
  Future<Either<Failure,Unit>>delete_repo(String id);


}