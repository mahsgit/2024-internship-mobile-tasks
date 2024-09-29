class ChatEntity{
  final String id;
  final String user1;
  final String user2;
  ChatEntity({
    required this.id,
    required this.user1,
    required this.user2,
  });

  factory ChatEntity.fromJson(Map<String, dynamic> json) {
    return ChatEntity(
      id: json['id'],
      user1: json['user1'],
      user2: json['user2'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user1': user1,
      'user2': user2,
    };
  }




}