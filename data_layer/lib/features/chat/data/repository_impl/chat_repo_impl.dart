import 'dart:io';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entity/chat_entity.dart';
import '../../domain/entity/message_entity.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository_contrat/chat_repo.dart';
import '../data_source/local_data_source/chat_local.dart';
import '../data_source/remote_data_source/chat_remote.dart';

class ChatRepoImpl extends ChatRepo{
  final ChatLocalDataSource chatLocalDataSource;
  final ChatRemoteDataSource chatRemoteDataSource;
  final NetworkInfo networkInfo;
  ChatRepoImpl(this.chatLocalDataSource, this.chatRemoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, bool>> deleteChatRepo(String id) async {
   if (await networkInfo.isconnected){
     try{
       final result= await chatRemoteDataSource.deleteChatdatasource(id);
       return Right(result);
     }on ServerException{
       return Left(ServerFailure("Server Failure"));
     }on SocketException{
       return Left(ConnectionFailure("Failed to connect"));
     }
  }throw UnimplementedError();
  }

  @override
  Future<Either<Failure, MessageEntity>> getChatMessageRepo(String id) async {
    if (await networkInfo.isconnected){
      try{
        final reslut=await chatRemoteDataSource.getChatMessagedatasource(id);
        return Right(reslut);
      }on ServerException{
        return Left(ServerFailure("Server Failure"));
      }on SocketException{
        return Left(ConnectionFailure("Failed to connect"));
      }
    }throw UnimplementedError();
   
  }






  @override
  Future<Either<Failure, ChatEntity>> initiateChatRepo(String id) async{
    if(await networkInfo.isconnected){
      try{
        final reslut=await chatRemoteDataSource.initiateChatdatasource(id);
        return Right(reslut);
      }on ServerException{
        return Left(ServerFailure("Server Failure"));
    }on SocketException{
      return Left(ConnectionFailure("Failed to connect"));
    }
  }throw UnimplementedError();
  }







  @override
  Future<Either<Failure, ChatEntity>> myChatByIdUsecaseRepo(String id) async{
    if (await networkInfo.isconnected){
      try{
        final result= await chatRemoteDataSource.myChatByIdUsecasedatasourct(id);
        return Right(result);
      }on ServerException{
        return Left(ServerFailure("Server Failure"));
  }on SocketException{
    return left(ConnectionFailure("Failed to connect"));
  }
    }throw UnimplementedError();
    }






  @override
  Future<Either<Failure, ChatEntity>> mychatrepo()  async{
  if (await networkInfo.isconnected){
    try {
      final result= await chatRemoteDataSource.mychatremotdata();
      return Right(result);
    }on ServerException{
      return Left(ServerFailure("Server Failure"));
    }on SocketException{
      return Left(ConnectionFailure("Failed to connect"));
    }

  }throw UnimplementedError();
  }
  



}