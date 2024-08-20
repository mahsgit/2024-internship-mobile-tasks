
import '../../domain/entities/userEntity.dart';

class Usermodel extends Userentity{
   Usermodel({
    required super.name,
    required super.email,
    required super.password,
  });

  factory Usermodel.fromJson(Map<String, dynamic> json) {
    return Usermodel(
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'password': password,
    };
  }

  Userentity toEntity() => Userentity(
    email: email,
    name:name,
    password: password
  );

  @override
  List<Object> get props => [ name, email, password];
}