import '../../data/model/usermodel.dart';

class Userentity{
  final String id;
  
  final String name;
  final String email;
  final String password;
  Userentity({
    required this.id,
    required this.email,
    required this.name,
    required this.password, 

  });
  Usermodel toModel() {
    return Usermodel(
      id: id,
      name: name,
      email: email,
      password: password,
    );
  }
}

  