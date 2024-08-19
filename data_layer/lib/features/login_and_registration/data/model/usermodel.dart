
import '../../domain/entities/userEntity.dart';

class Usermodel extends Userentity{
   Usermodel({
    required super.id,
    required super.name,
    required super.email,
    required super.password,
  });

  factory Usermodel.fromJson(Map<String, dynamic> json) {
    return Usermodel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  Userentity toEntity() => Userentity(
    id:id,
    name:name,
    email: email,
    password: password
  );

  @override
  List<Object> get props => [id, name, email, password];
}