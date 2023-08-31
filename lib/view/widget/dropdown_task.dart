import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';

class TaskDropDown extends StatefulWidget {
  const TaskDropDown({super.key});

  @override
  State<TaskDropDown> createState() => _TaskDropDownState();
}

class _TaskDropDownState extends State<TaskDropDown> {

  String? chosenValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: chosenValue,
          focusColor: Colors.white,
          icon: Icon(
            Icons.arrow_drop_down,
            color: AppColors.pinkColor, // <-- SEE HERE
          ),
          style: const TextStyle(
            color: AppColors.pinkColor,
            fontSize: 13,
            fontFamily: 'Montserrat',
          ),
          items: <String>[
            "All Tasks",
            "Completed",
            "Pending",
            "Confirmed",
            "Cancelled"
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hint: Text(
            "All Tasks",
            style: TextStyle(
              color: AppColors.pinkColor,
              fontSize: 13,
              fontFamily: 'Montserrat',
            ),
          ),
          onChanged: (String? value) {
            setState(() {
              chosenValue = value!;
            });
          },
        ),
      ),
    );
  }
}
