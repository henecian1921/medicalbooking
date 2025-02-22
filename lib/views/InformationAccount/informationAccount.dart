import 'package:flutter/material.dart';
import 'package:medical_booking_app/models/user.model.dart';
import 'package:medical_booking_app/providers/user.provider.dart';
import 'package:medical_booking_app/routes/routes.dart';
import 'package:medical_booking_app/views/InformationAccount/components/privacyPolicy.dart';
import 'package:medical_booking_app/views/InformationAccount/components/profile.dart';
import 'package:provider/provider.dart';

class InformationAccount extends StatefulWidget {
  const InformationAccount({super.key});

  @override
  State<InformationAccount> createState() => _InformationAccountState();
}

class _InformationAccountState extends State<InformationAccount> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    User? user = context.watch<UserProvider>().user;
    String? token = context.watch<UserProvider>().token;
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.952),
        ),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(15),
              child: Row(
                children: [
                    Icon(
                      Icons.account_circle,
                      size: 60,
                    ),
                    SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${user?.fullName}',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          Text(
                            'Mã người dùng: ${user?.id}',
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                        ],
                      ),
                ],
              ),

            ),
            user != null && token != null
                ? Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Profile()),
                                  );
                                },
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.folder_shared,
                                          color: Colors.blue,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Hồ sơ y tế "),
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      list(
                        const Icon(
                          Icons.announcement,
                          color: Colors.purple,
                        ),
                        "Điều khoản và Quy định",
                        const privacyPolicy(),
                        const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      list(
                        const Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                        "Cài đặt",
                        const InformationAccount(),
                        const BorderRadius.all(Radius.circular(0)),
                      ),
                      list(
                        const Icon(
                          Icons.share,
                          color: Colors.pink,
                        ),
                        "Chia sẻ ứng dụng",
                        const InformationAccount(),
                        const BorderRadius.all(Radius.circular(0)),
                      ),
                      list(
                          const Icon(
                            Icons.call,
                            color: Colors.lightBlue,
                          ),
                          "Liên hệ & hỗ trợ",
                          const InformationAccount(),
                          const BorderRadius.all(Radius.circular(0))),
                      list(
                        const Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        "Đăng xuất",
                        const InformationAccount(),
                        const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesWidget.routeLogin);
                      },
                      child: const Text('Đăng nhập'),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Container list(Icon icon, String text, Widget widget, BorderRadius border) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: border,
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => widget),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      icon,
                      const SizedBox(
                        width: 10,
                      ),
                      Text(text),
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
