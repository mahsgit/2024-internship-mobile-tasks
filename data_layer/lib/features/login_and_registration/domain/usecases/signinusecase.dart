import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/user_repo.dart';

class SigninUsecase extends Usecase<String, SigninParams> {
  final UserRepo repository;

  SigninUsecase(this.repository);

  @override
  Future<Either<Failure, String>> call(SigninParams params) async {
    return await repository.signin_repo(params.email, params.password);
  }
}

class SigninParams {
  final String email;
  final String password;

  const SigninParams({
    required this.email,
    required this.password,
  });
}
