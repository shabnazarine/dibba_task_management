import 'package:flutter/material.dart';
import 'home_view_large.dart';
import 'home_view_mobile.dart';
import 'home_view_small.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 1005) {
            if(constraints.maxWidth<600){
              return const HomeViewMobile();
            }else{
              return const HomeViewSmall();
            }
          } else {
            return const HomeViewLarge();
          }
        },
      ),
    );
  }
}
