import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/doctor.model.dart';
import 'package:medical_booking_app/providers/doctor.provider.dart';
import 'package:medical_booking_app/providers/user.provider.dart';
import 'package:medical_booking_app/routes/routes.dart';
import 'package:provider/provider.dart';

class ListDoctor extends StatefulWidget {
  const ListDoctor({super.key, required this.imageWidth});
  final double imageWidth;
  @override
  State<ListDoctor> createState() => _ListDoctorState();
}

class _ListDoctorState extends State<ListDoctor> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorProvider>().getDoctors();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Consumer<DoctorProvider>(
      builder: (context, doctorProvider, _) {
        if (!userProvider.checkLogin) {
          return Center(
            child: Text('Đăng nhập để xem thêm thông tin Bác sĩ và Khoa khám bệnh'),
          );
        } else if (doctorProvider.doctors.isEmpty) {
          return const Center(
            child: Text("Không có dữ liệu"),
          );
        } else {
          // Dữ liệu đã được tải xong, tiếp tục xử lý
          return _buildDoctorList(context, doctorProvider.doctors);
        }
      },
    );
  }

  Widget _buildDoctorList(BuildContext context, List<Doctor> doctors) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(
                Icons.person,
                color: Colors.blue,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Bác Sĩ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: doctors
                  .map((doctor) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                doctor.image,
                                fit: BoxFit.fill,
                                width: widget.imageWidth,
                                height: widget.imageWidth,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            GestureDetector(
                              onTap: () {
                                _dialogBuilder(context, doctor);
                              },
                              child: Text(
                                doctor.name,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              "${doctor.experience} năm kinh nghiệm",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 11),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _dialogBuilder(BuildContext context, Doctor doctor) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thông tin bác sĩ'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  doctor.image,
                  fit: BoxFit.fill,
                  width: widget.imageWidth,
                  height: widget.imageWidth,
                ),
                const SizedBox(height: 10,),
                Text(
                  '${doctor.name}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "Bằng cấp: ${doctor.degree} ",
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 10),
                Text(
                  "Kinh nghiệm: ${doctor.experience} năm ",
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 10,),
                Text(
                  """Chi tiết: ${doctor.description}""",
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),

              ],
            ),
          actions: <Widget> [
            TextButton(
              style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text('OK'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}
