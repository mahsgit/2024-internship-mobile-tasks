import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;


import '../../../../../core/constants/constants.dart';
import '../../../../login_and_registration/data/data_source/localtoken.dart';
import '../../../domain/entity/chat_entity.dart';
import '../../../domain/entity/message_entity.dart';

abstract class ChatRemoteDataSource {
  Future<bool>deleteChatdatasource(String id);
  Future<MessageEntity>getChatMessagedatasource(String id);
  Future<ChatEntity>initiateChatdatasource(String id);
  Future<ChatEntity>myChatByIdUsecasedatasourct(String id);
  Future<ChatEntity>mychatremotdata(); 
}


class ChatRemoteDataSourceImpl implements ChatRemoteDataSource{
 final http.Client client;
  final LocalToken localToken;

 ChatRemoteDataSourceImpl(this.client, this.localToken);





  @override
  Future<bool> deleteChatdatasource(String id)async {
    final response =await client.delete(
      Uri.parse(Urls.deleteChatUrl(id)),
      headers: await _getAuthHeader()
    );
    if (response.statusCode==201){
      return true;
    }
    else{
    return false;
    }
  }

  @override
  Future<MessageEntity> getChatMessagedatasource(String id) async{
    final response=await client.get(
    Uri.parse(Urls.getchatmessageUrl(id)),
    headers: await _getAuthHeader()
  );
  if(response.statusCode==200){
    final responseBody=response.body;
    return MessageEntity.fromJson(json.decode(responseBody));
  } else{
      throw Exception("Failed to load chat");
  }
  }

  @override
  Future<ChatEntity> initiateChatdatasource(String id) async{
   final String apiurl=Urls.initialchatUrl(id);
   final responce=await client.post(
    Uri.parse(apiurl),
    headers: await _getAuthHeader(),
    body: id,
   );
   if (responce.statusCode==201){
     final responseBody=responce.body;
     return ChatEntity.fromJson(json.decode(responseBody));


  }else{
    final responseBody=responce.body;
    throw Exception(json.decode(responseBody)['message'] ?? 'Failed to initiate chat');
  }}

  @override
  Future<ChatEntity> myChatByIdUsecasedatasourct(String id)async {
    final response=await client.get(
    Uri.parse(Urls.mychatbyidUrl(id)),
    headers: await _getAuthHeader()
  );
  if(response.statusCode==200){
    final responseBody=response.body;
    return ChatEntity.fromJson(json.decode(responseBody));
  } else{
      throw Exception("Failed to load chat");
  }



  }

  @override
  Future<ChatEntity> mychatremotdata() async {
  final response=await client.get(
    Uri.parse(Urls.mychatUrl()),
    headers: await _getAuthHeader()
  );
  if(response.statusCode==200){
    final responseBody=response.body;
    return ChatEntity.fromJson(json.decode(responseBody));
  } else{
      throw Exception("Failed to load chat");
  }
  
  
  }


   Future<Map<String, String>> _getAuthHeader() async {
    final token = await localToken.getToken();
    final headers = <String, String>{};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }
  
}


 