import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../entity/chat_entity.dart';
import '../repository_contrat/chat_repo.dart';

class MyChatsUsecase extends Usecase<ChatEntity , NoParams>{
  final ChatRepo chatRepo;
  MyChatsUsecase(this.chatRepo);

  @override
  Future<Either<Failure, ChatEntity>> call(NoParams params) async{
   return await chatRepo.mychatrepo();
    
  }
}