import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 2.0,
        shadowColor: Colors.black26,
        color: Colors.white,
        margin: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 5),
              child: Text(
                "Application Number",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.greenColor,
                  //fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5),
              child: Text(
                "Assigned To : Person 1",
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.redColor,
                  //fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
