import 'package:dartz/dartz.dart';
import 'package:task6/core/error/failures.dart';
import 'package:task6/core/usecases/usecase.dart';
import 'package:task6/features/product/domain/entities/product.dart';
import 'package:task6/features/product/domain/repositories/product_repo.dart';
// for params you can have class like this Deleteparam class or you can do in other usecase like add getall ...

class DeleteProductUsecase extends Usecase<Unit , Deleteparam>{
  final ProductRepo repository;
  DeleteProductUsecase(this.repository);
  @override
  Future<Either<Failure,Unit>> call(Deleteparam params) async{   
   return await repository.delete_repo(params.id);
  }
 

}
class Deleteparam{
  final String id;
 const Deleteparam(this.id);
}