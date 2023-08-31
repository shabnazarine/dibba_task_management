
import 'package:dibba_task_management/view/screens/surveyor/surveyor_view_large.dart';
import 'package:dibba_task_management/view/screens/surveyor/surveyor_view_mobile.dart';
import 'package:dibba_task_management/view/screens/surveyor/surveyor_view_small.dart';
import 'package:flutter/material.dart';

class SurveyorHome extends StatefulWidget {
  const SurveyorHome({super.key});

  @override
  State<SurveyorHome> createState() => _SurveyorHomeState();
}

class _SurveyorHomeState extends State<SurveyorHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 900) {
            if(constraints.maxWidth<600){
              return const SurveyorViewMobile();
            }else{
              return const SurveyorViewSmall();
            }
          } else {
            return const SurveyorViewLarge();
          }
        },
      ),
    );
  }
}
