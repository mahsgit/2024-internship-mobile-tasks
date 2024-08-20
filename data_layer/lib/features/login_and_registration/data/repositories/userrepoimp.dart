import 'dart:io';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/platform/network_info.dart';
import '../../domain/entities/userEntity.dart';
import '../../domain/repository/user_repo.dart';
import '../data_source/localtoken.dart';
import '../data_source/userremotedatasource.dart';
import '../model/usermodel.dart';

class Userrepoimp extends UserRepo {
  final UserRemoteDatasource userRemoteDatasource;
  final LocalToken localToken;
  final NetworkInfo networkInfo;

  Userrepoimp({
    required this.userRemoteDatasource,
    required this.networkInfo,
    required this.localToken,
  });

  @override
  Future<Either<Failure, String>> signin_repo(
      String email, String password) async {
    if (await networkInfo.isconnected) {
      try {
        final resulttoken =
            await userRemoteDatasource.authenticateuser(email, password);
        final result = await localToken.saveToken(resulttoken as String);
        return Right(resulttoken);
      } on ServerException {
        return const Left(ServerFailure("An error has occured"));
      } on SocketException {
        return const Left(ConnectionFailure("Failed to connect"));
      }
    } else {
      return Left(NetworkFailure("network error"));
    }
  }

  @override
  Future<Either<Failure, Userentity>> signup_repo(Userentity userEntity) async {
    if (await networkInfo.isconnected) {
      try {
        await userRemoteDatasource.adduser(userEntity.toModel());
        return Right(userEntity);
      } on ServerException catch (e) {
        return Left(ServerFailure("server failure"));
      }
    } else {
      return const Left(NetworkFailure("network error"));
    }
  }
}
