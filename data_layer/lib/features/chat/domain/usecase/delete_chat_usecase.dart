import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository_contrat/chat_repo.dart';
import 'my_chat_by_id_usecase.dart';

class DeleteChatUsecase extends Usecase<bool,ChatID>{
  final ChatRepo chatRepo;
  DeleteChatUsecase(this.chatRepo);

  @override
  Future<Either<Failure, bool>> call(ChatID params) async {
    final result =await chatRepo.deleteChatRepo(params.id);
    return result;
  }
}