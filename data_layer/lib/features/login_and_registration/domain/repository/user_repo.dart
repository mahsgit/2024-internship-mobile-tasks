import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/userEntity.dart';

abstract class UserRepo{
  Future<Either<Failure, Userentity>> signup_repo(Userentity userEntity);
  Future<Either<Failure, String>> signin_repo(String email,String password );
  Future<Either<Failure, Userentity>> getUserrepo(String token);
}