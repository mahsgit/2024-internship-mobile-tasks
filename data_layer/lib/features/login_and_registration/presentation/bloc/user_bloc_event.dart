import '../../domain/entities/userEntity.dart';

abstract class UserBlocEvent{}
class InitialEvent extends UserBlocEvent{}

class Signupevent extends UserBlocEvent{
  final String email;
  final String name;
  final String password;
  Signupevent({
    required this.email,
    required this.name,
    required this.password});

}

class Signinevent extends UserBlocEvent{
  final String email;
  final String password;
  Signinevent({
    required this.email,
    required this.password});

}


class GetmeEvent extends UserBlocEvent{
  final String token;
  GetmeEvent({
    required this.token,
    });

}