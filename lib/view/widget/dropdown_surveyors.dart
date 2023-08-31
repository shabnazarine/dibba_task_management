import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';

class SurveyorDropDown extends StatefulWidget {
  const SurveyorDropDown({super.key});

  @override
  State<SurveyorDropDown> createState() => _SurveyorDropDownState();
}

class _SurveyorDropDownState extends State<SurveyorDropDown> {

  String? selectedSurveyor;
  List<String> surveyorName = ["Syam", "Abhinand", "Arun Kumar", "Varun", "Prabhin", "Sunil", "Santhosh"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      child: InkWell(
          onTap: () async {
            showMyAlertDialog(context);
          },
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${selectedSurveyor ?? 'Select'}   ",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: AppColors.greenColor.withOpacity(.50)
                ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.greenColor,
                ),
              ],
            ),
          )
        //  DropdownButtonFormField(
        //   items: [],
        //   hint: Text("Select"),
        // ),
      ),
    );
  }

  showMyAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.greenColor.withOpacity(.50),
          content: StatefulBuilder(
            //* dialog is on different widget Tree. check dev-tools
            builder: (context, setStateD) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //const Text("Designation"),
                  const SizedBox(width: 12),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(
                        surveyorName.length,
                            (index) => item(
                          text: surveyorName[index], //sent String
                          isSelected: surveyorName[index] ==
                              selectedSurveyor, //check it is selected or not
                          ontap: () {
                            /// for inner dialog changes
                            setStateD(() {
                              selectedSurveyor = surveyorName[index];
                            });
                            Navigator.of(context)
                                .pop(); // if you wish to close the dilog on Select

                            setState(() {
                              //* for class state changes
                              selectedSurveyor = surveyorName[index];
                            });
                          },
                        ),
                      )
                    ],
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget item(
      {required String text,
        required bool isSelected,
        required Function ontap}) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 4,
      ),
      child: InkWell(
        onTap: () => ontap(),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(text,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            if (isSelected)
              const Icon(
                  Icons.check,
                color: Colors.white,
              ), // show only check while it is selected, or you can use the same logic on Main row item
          ],
        ),
      ),
    );
  }
}
