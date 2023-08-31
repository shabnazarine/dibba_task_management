
import 'package:flutter/material.dart';
import 'department_view_large.dart';
import 'department_view_small.dart';
import 'depatment_view_mobile.dart';

class DepartmentHome extends StatefulWidget {
  const DepartmentHome({super.key});

  @override
  State<DepartmentHome> createState() => _DepartmentHomeState();
}

class _DepartmentHomeState extends State<DepartmentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 1050) {
            if(constraints.maxWidth<600){
              return const DepartmentViewMobile();
            }else{
              return const DepartmentViewSmall();
            }
          } else {
            return const DepartmentViewLarge();
          }
        },
      ),
    );
  }
}
