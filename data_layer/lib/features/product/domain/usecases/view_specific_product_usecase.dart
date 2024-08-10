import 'package:dartz/dartz.dart';
import 'package:task6/core/error/failures.dart';
import 'package:task6/core/usecases/usecase.dart';
import 'package:task6/features/product/domain/repositories/product_repo.dart';
import 'package:task6/features/product/domain/entities/product.dart';

class ViewSpecificProductUsecase extends Usecase<Product, SearchByID>{
  final ProductRepo repository;
  ViewSpecificProductUsecase(this.repository);
  
  @override
  Future<Either<Failure,Product>> call(SearchByID params) async{
    return await repository.display_single_product_repo(params.id);
  }
}


class SearchByID{

  final String id;
  SearchByID(this.id);

}