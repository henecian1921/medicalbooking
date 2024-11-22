
import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/user.model.dart';
import 'package:medical_booking_app/providers/user.provider.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  late TextEditingController fullNameController;
  late TextEditingController dateOfBirthController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  //late TextEditingController avatarController;

  @override
  void initState() {
    super.initState();

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final User user = userProvider.user!;

    // Khởi tạo các bộ điều khiển văn bản với dữ liệu ban đầu từ người dùng
    fullNameController = TextEditingController(text: user.fullName as String);
    dateOfBirthController =  TextEditingController(text: user.dateOfBirth);
    phoneController = TextEditingController(text: user.phone);
    addressController = TextEditingController(text: user.address);


  }
  @override
  void dispose() {
    // Giải phóng các bộ điều khiển văn bản khi widget bị hủy
    fullNameController.dispose();
    phoneController.dispose();
    dateOfBirthController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    if (!userProvider.checkLogin) {
      return const Center(child: Text("Vui lòng đăng nhập"));
    }

    //Lấy thông tin người dùng từ provider
    final User user = userProvider.user!;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
            'Thông tin người dùng',
        style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
              radius: 60,
              backgroundImage: user.avatar != null && user.avatar!.isNotEmpty ?
              NetworkImage(user.avatar!) : const AssetImage('assets/null_avatar.png')
              as ImageProvider,
            ),
            ),
            const SizedBox(height: 10,),

            info("ID", "${user.id}"),
          // info("Họ và tên", "${user.fullName}"),
            _buildTextField("Họ tên", fullNameController, true),
          // info("Ngày sinh", "${user.dateOfBirth}"),
            _buildTextField("Ngày sinh", dateOfBirthController, true),
          // info("Số điện thoại", "${user.phone}"),
            _buildTextField("Số điện thoại", phoneController, true),
            info("Email đăng ký", "${user.email}"),
          // info("Địa chỉ", "${user.address}"),
            _buildTextField("Địa chỉ", addressController, true),

            const SizedBox(height: 10,),

            Center(
              child: TextButton(
                onPressed: () async {
                  //Lấy dữ liệu từ các textfield
                  final updatedUser = User(
                    id: userProvider.user!.id,
                    fullName: fullNameController.text,
                    phone: phoneController.text,
                    dateOfBirth: dateOfBirthController.text,
                    address: addressController.text,
                    email: '',
                    avatar: '',
                  );
                  await userProvider.updateUser(updatedUser);

                  if (userProvider.errorMessage!.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Cập nhật thông tin thành công'),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Cập nhật thất bại: ${userProvider.errorMessage}'),
                    ));
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue[500],
                  foregroundColor: Colors.indigo,
                ),
                child: const Text("Cập nhật thông tin",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, bool enabled) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.grey, fontSize: 18),
          ),
          SizedBox(height: 3,),
          TextField(
            style: TextStyle(fontSize: 17),
            controller: controller,
            enabled: enabled,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(10)
            ),
          ),
        ],
      ),
    );
  }

  //Hiển thị thông tin người dùng
  Container info(String text1, String text2) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: const TextStyle(color: Colors.grey, fontSize: 18),
          ),
          SizedBox(height: 3,),
          Text(
            text2,
            style: const TextStyle(color: Colors.black, fontSize: 17),
          ),
        ],
      ),
    );
  }
}
