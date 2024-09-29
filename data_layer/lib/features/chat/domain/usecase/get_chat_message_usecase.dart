import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../entity/message_entity.dart';
import '../repository_contrat/chat_repo.dart';
import 'my_chat_by_id_usecase.dart';

class GetChatMessageUsecase extends Usecase<MessageEntity, ChatID>{
  final ChatRepo chatRepo;
  GetChatMessageUsecase(this.chatRepo);

  @override
  Future<Either<Failure, MessageEntity>> call(ChatID params) async {
   return  await chatRepo.getChatMessageRepo(params.id);
  }
}