import 'package:dibba_task_management/view/screens/dashboard/team/team_view_large.dart';
import 'package:dibba_task_management/view/screens/dashboard/team/team_view_mobile.dart';
import 'package:dibba_task_management/view/screens/dashboard/team/team_view_small.dart';
import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 800) {
            if(constraints.maxWidth<600){
              return const TeamViewMobile();
            }else{
              return const TeamViewSmall();
            }
          } else {
            return const TeamViewLarge();
          }
        },
      ),
    );
  }
}
