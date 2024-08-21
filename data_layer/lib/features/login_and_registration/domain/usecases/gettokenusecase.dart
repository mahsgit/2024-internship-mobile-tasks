import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/userEntity.dart';
import '../repository/user_repo.dart';

class GetUserEntityUseCase extends Usecase<Userentity, String> {
  final UserRepo repository;

  GetUserEntityUseCase(this.repository);

  @override
  Future<Either<Failure, Userentity>> call(String token) async {
    return await repository.getUserrepo(token);
  }
}
