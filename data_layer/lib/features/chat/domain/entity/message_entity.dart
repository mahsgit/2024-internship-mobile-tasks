class MessageEntity{
  final String id;
  final String content;
  final String type;
  final String sender;
  final String chat;
  MessageEntity({
    required this.id,
    required this.content,
    required this.type,
    required this.sender,
    required this.chat,
  });
factory MessageEntity.fromJson(Map<String, dynamic> json) {
    return MessageEntity(
      id: json['id'],
      content: json['content'],
      type: json['type'],
      sender: json['sender'],
      chat: json['chat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'type': type,
      'sender': sender,
      'chat': chat,
    };
  }


}