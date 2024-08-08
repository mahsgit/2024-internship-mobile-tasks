
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task6/core/error/failures.dart';
import 'package:task6/features/product/domain/entities/product.dart';

// type is any type of thing product , notitication, error 
// param is the instruction to work with like search by id , id is param search class is return type 
abstract class Usecase <Type, Params>{
  Future<Either<Failure,Type>> call(Params params);
}
//   if we dont need anything to start with 
//equtable is optional
class NoParams extends Equatable{
  @override
List<Object?>get props=>[];
}


