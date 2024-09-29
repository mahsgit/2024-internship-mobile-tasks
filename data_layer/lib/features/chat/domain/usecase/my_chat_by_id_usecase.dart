import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../entity/chat_entity.dart';
import '../repository_contrat/chat_repo.dart';

class MyChatByIdUsecase extends Usecase<ChatEntity, ChatID>{
  final ChatRepo  chatRepo;
  MyChatByIdUsecase(this.chatRepo);

  @override
  Future<Either<Failure, ChatEntity>> call(ChatID params)async {
    return  await chatRepo.myChatByIdUsecaseRepo(params.id);
  }
} 



class ChatID{
  final String id;
  ChatID(this.id);
}