import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/healthForm.model.dart';
import 'package:medical_booking_app/providers/history.provider.dart';
import 'package:medical_booking_app/providers/user.provider.dart';
import 'package:medical_booking_app/routes/routes.dart';
import 'package:provider/provider.dart';


class MedicalHistory extends StatefulWidget {
  const MedicalHistory({super.key});

  @override
  State<MedicalHistory> createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HistoryProvider>().getHealthForms();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Consumer<HistoryProvider>(
      builder: (context, historyProvider, _) {
        if (!userProvider.checkLogin) {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesWidget.routeLogin);
              },
              child: Text('Đăng nhập'),
            ),
          );

        } else if (historyProvider.healthForms.isEmpty) {
          return Center(
            child: Text(
              "Không tải được dữ liệu",
              textAlign: TextAlign.center,
            ),
          );
        }
        else {
          // Dữ liệu đã được tải xong, tiếp tục xử lý
          return _buildFormList(context, historyProvider.healthForms);
        }
      },
    );
  }
  Widget _buildFormList(BuildContext context, List<HealthForm> healthForm) {
    return Scaffold(
    appBar: AppBar(
      title: Text(
          "Lịch sử khám bệnh",
        style: TextStyle(
          color: Colors.white
        ),
      ),
      backgroundColor: Colors.blue,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    body:
      Column(
      children:
      healthForm.map((form) => GestureDetector(
        onTap: (){
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Thông tin chi tiết",
                  style: TextStyle(fontSize: 18,color: Colors.blue),),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Tên bệnh nhân: ${form.namePatient}"),
                      const SizedBox(height: 10),
                      Text("Email đăng ký: ${form.email}"),
                      SizedBox(height: 10),
                      Text("SĐT: ${form.phoneNumber}"),
                      SizedBox(height: 10),
                      Text("Nguyên nhân: ${form.reason}"),
                      SizedBox(height: 10),
                      Text("Ca khám: ${form.shift["id"]}"),
                      SizedBox(height: 10),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text("Đóng", style: TextStyle(color: Colors.blue),),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        },
            child: Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                          SizedBox(height: 20,),
                          Text(
                            "Tên bệnh nhân: ${form.namePatient}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 3,),
                          Text(
                            "Email đăng ký: ${form.email}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 11),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(right: 50, left: 0),
                          child: Divider(
                            thickness: 1,
                            color: Colors.blue,),
                        )
                      ],
                    ),
                  ),
          ))
          .toList(),
      ),
    );
  }
}