import 'package:flutter/material.dart';
import 'package:medical_booking_app/Contact/Service/MessProvider.dart';
import 'package:medical_booking_app/providers/department.provider.dart';
import 'package:medical_booking_app/providers/doctor.provider.dart';
import 'package:medical_booking_app/providers/healthForm.provider.dart';
import 'package:medical_booking_app/providers/history.provider.dart';
import 'package:medical_booking_app/providers/shift.provider.dart';
import 'package:medical_booking_app/providers/user.provider.dart';
import 'package:medical_booking_app/routes/routeGenrator.dart';
import 'package:medical_booking_app/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:medical_booking_app/const/sharedPreference.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPre.initShared();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => DepartmentProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => DoctorProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ShiftProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => HealthFormProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => HistoryProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => MessProvider(),
          ),
        ],
        child: MaterialApp(
          initialRoute: RoutesWidget.routeHome,
          onGenerateRoute: RouteGenerator.generateRoute,
        ));
  }
}
