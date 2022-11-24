import 'package:airapp/boxes/boxInstructor.dart';
import 'package:airapp/boxes/boxMaintenance.dart';
import 'package:airapp/boxes/boxStudent.dart';
import 'package:airapp/database/instructor_model.dart';
import 'package:airapp/home/home.dart';
import 'package:airapp/landingPage.dart';
import 'package:airapp/authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'boxes/boxInspection.dart';
import 'database/maintenanceTask_model.dart';
import 'database/scheduledInspection_model.dart';
import 'database/student_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(StudentAdapter());
  Hive.registerAdapter(InstructorAdapter());
  Hive.registerAdapter(ScheduledInspectionAdapter());
  Hive.registerAdapter(MaintenanceTaskAdapter());
  await Hive.openBox<Student>(HiveBoxesStudent.student);
  await Hive.openBox<Instructor>(HiveBoxesInstructor.instructor);
  await Hive.openBox<ScheduledInspection>(HiveBoxesInspection.inspection);
  await Hive.openBox<MaintenanceTask>(HiveBoxesMaintenance.maintenance);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Air Maintenance App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: LandingPage(),
    );
  }
}
