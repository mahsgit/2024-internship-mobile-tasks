import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/constants/constants.dart';
import '../model/usermodel.dart';

abstract class UserRemoteDatasource {
  Future<Usermodel> adduser(Usermodel userEntity);
  Future<Usermodel> getmeremote(String token);
  Future<String> authenticateuser(String email, String password);
}

class UserRemoteDatasourceImpl extends UserRemoteDatasource {
  final http.Client client;

  UserRemoteDatasourceImpl({required this.client});

  @override
  Future<Usermodel> adduser(Usermodel userEntity) async {
    final String apiUrl = Urls.adduserurl();
    final body = json.encode(userEntity.toJson());

    final response = await client.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );

    if (response.statusCode == 201) {
      final data = json.decode(response.body);
      return Usermodel.fromJson(data);
    } else {
      final data = json.decode(response.body);
      throw Exception(data['message'] ?? 'Failed to register user');
    }
  }

  @override
  Future<Usermodel> getmeremote(String token) async {
    final String apiUrl = Urls.meuserurl();

    final response = await client.get(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print("Decoded JSON: $data"); 
      final temp= Usermodel.fromJson(data);
      print("Decoded JSON: $temp"); 

      return temp;
    } else {
      final data = json.decode(response.body);
      throw Exception(data['message'] ?? 'no user logged ');
    }
  }

  @override
  Future<String> authenticateuser(String email, String password) async {
    final String apiUrl = Urls.getuserurl();
    final body = json.encode({
      'email': email,
      'password': password,
    });

    final response = await client.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );

    if (response.statusCode == 201) {
      final data = json.decode(response.body);
      final token = data['data']['access_token'];

      return token;
    } else {
      final data = json.decode(response.body);
      throw Exception(data['message'] ?? 'Failed to authenticate user');
    }
  }
}
