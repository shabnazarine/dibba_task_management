import 'package:dibba_task_management/view/screens/account/login.dart';
import 'package:dibba_task_management/view/screens/admin/admin_home.dart';
import 'package:dibba_task_management/view/screens/counter/counter_home.dart';
import 'package:dibba_task_management/view/screens/dashboard/home/home.dart';
import 'package:dibba_task_management/view/screens/department/department_home.dart';
import 'package:dibba_task_management/view/screens/department/department_update_task.dart';
import 'package:dibba_task_management/view/screens/department/department_update_task_mobile.dart';
import 'package:dibba_task_management/view/screens/department/department_view_task_mobile.dart';
import 'package:dibba_task_management/view/screens/surveyor/surveyor_home.dart';
import 'package:dibba_task_management/view/screens/test_screen.dart';
import 'package:dibba_task_management/view/widget/dropdown_department.dart';

import 'package:flutter/material.dart';

import 'constants/custom_colors.dart';

/// Provides access to the ObjectBox Store throughout the app.
//late ObjectBox objectbox;

Future<void> main() async {
  // This is required so ObjectBox can get the application directory
  // to store the database in.
  WidgetsFlutterBinding.ensureInitialized();

 // objectbox = await ObjectBox.create();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColorLight.withOpacity(.2)),
        //primarySwatch: Colors.amber,
        //colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.primaryColorLight),
        useMaterial3: true,
          fontFamily: 'Montserrat'
      ),
      home:  const Login(),
    );
  }
}


