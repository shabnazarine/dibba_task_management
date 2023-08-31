import 'package:dibba_task_management/view/widget/dropdown_department.dart';
import 'package:dibba_task_management/view/widget/dropdown_task.dart';
import 'package:flutter/material.dart';
import '../../constants/custom_colors.dart';
import '../widget/application_task_card.dart';
import '../widget/dropdown_application_type.dart';
import '../widget/dropdown_designation.dart';
import '../widget/dropdown_location.dart';
import '../widget/dropdown_surveyors.dart';
import '../widget/team_card.dart';

class TestClass extends StatefulWidget {
  const TestClass({super.key});

  @override
  State<TestClass> createState() => _TestClassState();
}

class _TestClassState extends State<TestClass> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.5;
    final double itemWidth = size.width / 1.5;

    return Scaffold(
      body: SingleChildScrollView(
        child:Center(
          child: TaskDropDown(),
        ),
      )
    );
  }
}
