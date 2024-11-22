import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medical_booking_app/const/sharedPreference.dart';
import 'package:medical_booking_app/models/healthForm.model.dart';

import '../const/file.const.dart';

class HistoryService {

  String? token = SharedPre.getToken();
  static Future<List<HealthForm>> getHealthForms(token) async {
    late List<HealthForm> lists;
    print("Test token 3: $token");
    final response = await http.get(
      Uri.parse(
          '${host}:${port}/api/v1/health-forms/history'),
      headers: {'Authorization': 'Bearer $token'},
    );

    String responseBody = response.body;
    // Decode the response using UTF-8 encoding
    String decodedResponse = utf8.decode(responseBody.codeUnits);
    if (response.statusCode == 200) {
      // Decode JSON data
      final jsonData = jsonDecode(decodedResponse);
      // Parse data and return list of Department objects
      lists = List<HealthForm>.from(
          jsonData['data']['items'].map((x) => HealthForm.fromJson(x)));

      print("jsonData ne: $jsonData");
    } else {
      throw Exception('Failed to load health forms');
    }
    return lists;
  }
}