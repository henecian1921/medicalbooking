import 'package:flutter/cupertino.dart';
import 'package:medical_booking_app/const/sharedPreference.dart';
import 'package:medical_booking_app/models/healthForm.model.dart';
import 'package:medical_booking_app/services/history.service.dart';

class HistoryProvider extends ChangeNotifier {
  List<HealthForm> healthForms = [];
  String? errorMessage = "";

  Future<void> getHealthForms() async {
    try {
      String? token = SharedPre.getToken();
      print("Test token 1 $token");
      healthForms = await HistoryService.getHealthForms(token);
    } catch (e) {
      // Xử lý khi gặp lỗi
      errorMessage = 'Đã xảy ra lỗi. Vui lòng thử lại sau.';
      print("Lỗi: $e");
    }
    notifyListeners();
  }
}