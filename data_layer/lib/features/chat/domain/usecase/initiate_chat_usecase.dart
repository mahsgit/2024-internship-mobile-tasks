import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../entity/chat_entity.dart';
import '../repository_contrat/chat_repo.dart';

class InitiateChatUsecase extends Usecase<ChatEntity,Userid>{
  final ChatRepo chatRepo;
  InitiateChatUsecase(this.chatRepo);

  @override
  Future<Either<Failure, ChatEntity>> call(Userid params) async {
  return await chatRepo.initiateChatRepo(params.id);
  }
}

class Userid{
  final String id;
  Userid(this.id);
} 