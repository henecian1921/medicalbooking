
import 'package:flutter/cupertino.dart';
import 'package:medical_booking_app/Contact/Model/MessageModel.dart';
import 'package:medical_booking_app/Contact/Service/MessService.dart';
import 'package:medical_booking_app/providers/user.provider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class MessProvider extends ChangeNotifier {
  MessageModel? messageModel;
  String? idU;
  String? idS;
  String? errorMessage;
  List<MessageModel> messages = [];

  Future<void> send(String idU,String idS, String text) async {
    try {
      final respone = await MessService.sendMess(idU, idS, text);
      if (respone["code"] == 200) {
        messageModel = MessageModel(
            message: respone["data"]["message"],
            created_at: respone["data"]["created_at"],
            sender_id: respone["data"]["sender_id"],
            receiver_id: respone["data"]["receiver_id"]
        );
        print("Gửi tin nhắn thành công");
      }
    } catch (e){
      errorMessage = 'Đã xảy ra lỗi';
      print("Error: $errorMessage");
    }
    notifyListeners();
  }

  Future<void> get(String idU, String text) async {
    try {
      messages = await MessService.getMess(idU, text);
    } catch(e) {
      print("Lỗi: $e");
    }
  }
}