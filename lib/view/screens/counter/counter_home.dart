import 'package:flutter/material.dart';
import 'counter_view_large.dart';
import 'counter_view_mobile.dart';
import 'counter_view_small.dart';

class CounterHome extends StatefulWidget {
  const CounterHome({super.key});

  @override
  State<CounterHome> createState() => _CounterHomeState();
}

class _CounterHomeState extends State<CounterHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 900) {
            if(constraints.maxWidth < 600){
              return const CounterViewMobile();
            }else{
              return const CounterViewSmall();
            }
          } else {
            return const CounterViewLarge();
          }
        },
      ),
    );
  }
}
