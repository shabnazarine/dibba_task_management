import 'package:flutter/material.dart';

import 'admin_view_large.dart';
import 'admin_view_mobile.dart';
import 'admin_view_small.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 1350) {
            if(constraints.maxWidth<870){
              return const AdminViewMobile();
            }else{
              return const AdminViewSmall();
            }
          } else {
            return const AdminViewLarge();
          }
        },
      ),
    );
  }
}
