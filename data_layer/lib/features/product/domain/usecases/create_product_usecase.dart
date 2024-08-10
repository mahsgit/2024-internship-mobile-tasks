import 'package:dartz/dartz.dart'; // For Either
import 'package:task6/core/error/failures.dart';
import 'package:task6/core/usecases/usecase.dart';
import 'package:task6/features/product/domain/entities/product.dart';
import 'package:task6/features/product/domain/repositories/product_repo.dart';

class CreateProductUsecase extends Usecase<Product ,Product>{
  // repository is variable  that hold reference to object implementing productrepo
  // so this is how we send data to product repo and its method using repository instance
  // we have to pass that to createusecase constructor
  final ProductRepo repository;
  CreateProductUsecase(this.repository);

  //since we are using param method of usecase abstrac we have to override it and 
  // send data to product repositor add method 
  @override
  // call can be replaced with excute but since we have only one method in test if we use call
  // we dont have to call addproductusecase just passit 
 Future<Either<Failure,Product>> call(Product params) async{
  //  so we are saying send product entity which we instatnce using param cause Product is class
  // and send it to add_product_repo
  return await repository.add_product_repo(params);
 }
}

