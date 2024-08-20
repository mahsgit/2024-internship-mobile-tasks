import '../../domain/entities/userEntity.dart';

abstract class UserBlocState{}

class UserInitial extends UserBlocState{}

class UserSuccess extends UserBlocState{
  final Userentity user;
  UserSuccess(this.user);
}
class UserFailure extends UserBlocState{
  final String error;
  UserFailure(this.error);
}
class UserSuccesslogin extends UserBlocState{
  final String userlogged;
  UserSuccesslogin(this.userlogged);
}