class MessageModel {

  String message;
  String created_at;
  String sender_id;
  String receiver_id;

  MessageModel(
      {
        required this.message,
        required this.created_at,
        required this.sender_id,
        required this.receiver_id,
      });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
        message: json['message'],
        created_at: json['created_at'],
        sender_id: json['sender_id'],
        receiver_id: json['receiver_id']
    );
  }
}