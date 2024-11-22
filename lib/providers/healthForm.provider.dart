import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:medical_booking_app/const/sharedPreference.dart';
import 'package:medical_booking_app/models/healthForm.model.dart';
import 'package:medical_booking_app/services/history.service.dart';

class HealthFormProvider extends ChangeNotifier {

  List<HealthForm> healthForms = [];
  String? errorMessage = "";
  Future<void> getHealthForms() async {
    try {
      String? token = SharedPre.getToken();
      healthForms = await HistoryService.getHealthForms(token);
    } catch (e) {
      // Xử lý khi gặp lỗi
      errorMessage = 'Đã xảy ra lỗi. Vui lòng thử lại sau.';
      print("Error: $e");
    }
    notifyListeners();
  }
}
