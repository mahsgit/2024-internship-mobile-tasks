import '../../data/model/usermodel.dart';

class Userentity {
  final String email;
  final String name;
  final String password;

  Userentity({
    required this.email,
    required this.name,
    required this.password,
  });

  Usermodel toModel() {
    return Usermodel(
      id: '',
      email: email,
      name: name,
    );
  }
}
