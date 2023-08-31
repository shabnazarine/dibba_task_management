
import 'package:dibba_task_management/view/screens/dashboard/search/search.dart';
import 'package:dibba_task_management/view/screens/dashboard/search/search_mobile.dart';
import 'package:flutter/material.dart';

class SearchHome extends StatefulWidget {
  const SearchHome({super.key});

  @override
  State<SearchHome> createState() => _SearchHomeState();
}

class _SearchHomeState extends State<SearchHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 1005) {
            if(constraints.maxWidth<600){
              return const SearchMobile();
            }else{
              return const SearchPage();
            }
          } else {
            return const SearchPage();
          }
        },
      ),
    );
  }
}
