import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medical_booking_app/Contact/Model/MessageModel.dart';

import '../../const/file.const.dart';

class MessService {

  static Future<dynamic> sendMess (String idU, String idS, String message) async {
    final response = await http.post(
      Uri.parse(
          '${host}:${portM}/api/messages/send/${idU}'
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "message": message,
        "userId": idS
      })
    );
    // Convert the response body to a string
    String responseBody = response.body;

    // Decode the response using UTF-8 encoding
    String decodedResponse = utf8.decode(responseBody.codeUnits);

    // Parse the JSON data
    Map<String, dynamic> responseData = jsonDecode(decodedResponse);

    return responseData;
  }

  static Future<dynamic> getMess (String id, String message) async {
    late List<MessageModel> lists;
    final response = await http.get(
        Uri.parse(
            '${host}:${portM}/api/messages/${id}'
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
    );
    String responseBody = response.body;
    // Decode the response using UTF-8 encoding
    String decodedResponse = utf8.decode(responseBody.codeUnits);
    if (response.statusCode == 200) {
      // Decode JSON data
      final jsonData = jsonDecode(decodedResponse);
      // Parse data and return list of Department objects
      lists = List<MessageModel>.from(
          jsonData['data']['items'].map((x) => MessageModel.fromJson(x)));

      print("jsonData ne: $jsonData");
    } else {
      throw Exception('Failed to load message');
    }
    return lists;
  }
}