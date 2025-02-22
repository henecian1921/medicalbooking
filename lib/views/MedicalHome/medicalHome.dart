import 'package:flutter/material.dart';
import 'package:medical_booking_app/Contact/Screens/Homescreen.dart';
import 'package:medical_booking_app/providers/department.provider.dart';
import 'package:medical_booking_app/providers/shift.provider.dart';
import 'package:medical_booking_app/providers/user.provider.dart';
import 'package:medical_booking_app/models/user.model.dart';
import 'package:medical_booking_app/views/HealthForm/healthForm.dart';
import 'package:medical_booking_app/views/InformationAccount/informationAccount.dart';
import 'package:medical_booking_app/views/MedicalHistory/medicalHistory.dart';
import 'package:medical_booking_app/views/MedicalHome/components/descriptionMedicalHome.dart';
import 'package:medical_booking_app/views/MedicalHome/components/listDepartment.dart';
import 'package:medical_booking_app/views/MedicalHome/components/listDoctor.dart';
import 'package:medical_booking_app/views/MedicalHome/components/navbarMedicalHome.dart';
import 'package:medical_booking_app/views/MedicalHome/components/newMedical.dart';
import 'package:medical_booking_app/views/MedicalHome/components/titleAppBarMedicalHome.dart';
import 'package:provider/provider.dart';

class MedicalHome extends StatefulWidget {
  const MedicalHome({super.key});

  @override
  State<MedicalHome> createState() => _MedicalHomeState();
}

class _MedicalHomeState extends State<MedicalHome> {
  int _selectedIndex = 0;
  int? id;
  // List of widgets for each tab
  final List<Widget> _widgetOptions = <Widget>[
    // Widget for Trang chủ
    const BodyHome(),
    // Widget for Đặt khám
    HealthForm(),
    // Widget for Lịch sử
    MedicalHistory(),
    // Widget for Cá nhân
    const InformationAccount(),
    // Widget for Hỏi đáp
    Homescreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ShiftProvider>().getShifts();
    context.read<DepartmentProvider>().getDepartments();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _selectedIndex == 0
            ? AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Color.fromRGBO(25, 117, 220, 1),
                toolbarHeight: 80,
                title: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: TitleAppBarMedicalHome(),
                ),
              )
            : AppBar(automaticallyImplyLeading: false, toolbarHeight: 0),
        body: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: 'Đặt khám',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_edu_outlined),
              label: 'Lịch sử',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Cá nhân',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Hỏi đáp',
            ),
          ],
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.blueAccent,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class BodyHome extends StatefulWidget {
  const BodyHome({super.key});
  @override
  State<BodyHome> createState() => BodyHomeState();
}

class BodyHomeState extends State<BodyHome> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    User? user = context.watch<UserProvider>().user;
    String? token = context.watch<UserProvider>().token;
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(208, 190, 199, 0.3),
        ),
        child: Column(
          children: [
            NavbarMedicalHome(
              imageWidth: screenWidth,
              imageHeight: screenHeight / 3.5,
            ),
            user == null && token == null
                ? DescriptionMedicalHome(
                    imageWidth: screenWidth,
                    imageHeight: screenHeight / 4,
                  )
                : const SizedBox(),
            ListDoctor(
              imageWidth: screenWidth / 6,
            ),
            SizedBox(height: 10,),
            ListDepartment(
              imageWidth: screenWidth / 8,
            ),
            SizedBox(height: 10,),
            NewMedical(
              imageWidth: screenWidth,
              imageHeght: screenHeight / 4,
            ),
          ],
        ),
      ),
    );
  }
}
