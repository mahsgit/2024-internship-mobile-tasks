import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../product/presentation/pages/chat.dart';
import '../entity/chat_entity.dart';
import '../entity/message_entity.dart';

abstract class ChatRepo{
  Future <Either<Failure, ChatEntity>> mychatrepo();
  Future<Either<Failure,ChatEntity>>myChatByIdUsecaseRepo(String id );
  Future<Either<Failure,ChatEntity>>initiateChatRepo(String id);
  Future<Either<Failure,MessageEntity>>getChatMessageRepo(String id);
  Future<Either<Failure,bool>>deleteChatRepo(String id);  
  
}

