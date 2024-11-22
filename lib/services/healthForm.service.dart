import 'dart:io';
import 'package:http/http.dart' as http;
import '../const/file.const.dart';

class HealthFormService {
  static Future<int> createHealthForm(
    String token,
    String namePatient,
    String email,
    String phoneNumber,
    int shiftId,
    String reason,
    String cccdImagePath, // Đường dẫn của ảnh CCCD
    String bhytImagePath, // Đường dẫn của ảnh BHYT
  ) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          '${host}:${port}/api/v1/health-forms'),
    );
    request.headers['Authorization'] = 'Bearer $token';
    request.fields['namePatient'] = namePatient;
    request.fields['email'] = email;
    request.fields['phoneNumber'] = phoneNumber;
    request.fields['shift'];
    request.fields['reason'] = reason;

    // Đọc nội dung của ảnh CCCD và thêm vào yêu cầu
    if (cccdImagePath.isNotEmpty) {
      File cccdImageFile = File(cccdImagePath);
      if (cccdImageFile.existsSync()) {
        request.files.add(await http.MultipartFile.fromPath(
          'cccd',
          cccdImagePath,
          filename: 'cccd_image.jpg', // Tên tệp trên server
        ));
      }
    }

    // Đọc nội dung của ảnh BHYT và thêm vào yêu cầu
    if (bhytImagePath.isNotEmpty) {
      File bhytImageFile = File(bhytImagePath);
      if (bhytImageFile.existsSync()) {
        request.files.add(await http.MultipartFile.fromPath(
          'bhyt',
          bhytImagePath,
          filename: 'bhyt_image.jpg', // Tên tệp trên server
        ));
      }
    }
    var response = await request.send();
    return response.statusCode;
  }
}


