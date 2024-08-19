import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/userEntity.dart';
import '../repository/user_repo.dart';

class Signinusecase extends Usecase<Userentity,Userentity>{
   final UserRepo repository;
  Signinusecase(this.repository);
  @override
 Future<Either<Failure,Userentity>> call (Userentity params) async{
  return await repository.signup_repo(params);
 }
}