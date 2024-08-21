import '../../domain/entities/userEntity.dart';

class Usermodel extends Userentity {
  Usermodel({
    required String id,
    required String name,
    required String email,
  }) : super(
          name: name,
          email: email,
          password: '', 
        );

  factory Usermodel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>?;

    return Usermodel(
      id: data?['id'] ?? '',
      name: data?['name'] ?? '',
      email: data?['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }

  Userentity toEntity() => Userentity(
        name: name,
        email: email,
        password: '', // Handle password differently if needed
      );

  @override
  List<Object?> get props => [name, email];
}
