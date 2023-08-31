import 'package:dibba_task_management/view/screens/dashboard/task/task_view_large.dart';
import 'package:dibba_task_management/view/screens/dashboard/task/task_view_mobile.dart';
import 'package:dibba_task_management/view/screens/dashboard/task/task_view_small.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 1400) {
            if(constraints.maxWidth<600){
              return const TaskViewMobile();
            }else{
              return const TaskViewSmall();
            }
          } else {
            return const TaskViewLarge();
          }
        },
      ),
    );
  }
}
