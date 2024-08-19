abstract class UserBlocEvent{}

class Signupevent extends UserBlocEvent{
  final String email;
  final String name;
  final String password;
  Signupevent({
    required this.email,
    required this.name,
    required this.password});

}

class InitialEvent extends UserBlocEvent{}