import 'package:dibba_task_management/constants/custom_colors.dart';
import 'package:dibba_task_management/view/widget/dropdown_application_type.dart';
import 'package:dibba_task_management/view/widget/dropdown_location.dart';
import 'package:dibba_task_management/view/widget/dropdown_status.dart';
import 'package:dibba_task_management/view/widget/dropdown_surveyors.dart';
import 'package:flutter/material.dart';

class DepartmentCreateTask extends StatefulWidget {
  const DepartmentCreateTask({super.key});

  @override
  State<DepartmentCreateTask> createState() => _DepartmentCreateTask();
}

class _DepartmentCreateTask extends State<DepartmentCreateTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  width: 600,
                  height: 450,
                  color: AppColors.primaryColorLight,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image(image: AssetImage("assets/images/logo.png"),
                              width: 35,
                              height: 45,
                            ),
                            Text(
                              "Dibba Municipality",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "Create Task(Internal)",
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Montserrat',
                              color: AppColors.greenColor
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 50, top: 50),
                            child: Text(
                              "Application No",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: Colors.white
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:  EdgeInsets.only(left: 60, top: 30, right: 200),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.50),
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  hintText: "AppNo45565",
                                  hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(.50),
                                    fontSize: 14,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50, top: 50),
                            child: Text(
                              "Creation Date",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: Colors.white
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 70, top: 30, right: 50),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.50),
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  ),
                                  hintText: "Monday 22, July 2023",
                                  hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(.50),
                                    fontSize: 14,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only( top: 50, right: 120),
                            child: Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50, top: 40),
                            child: Text(
                              "Application Type",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: Colors.white
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 50, top: 40, right: 100),
                              child: ApplicationTypeDropDown(),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 220, right: 100),
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white.withOpacity(.50),
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            hintText: "Reason",
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(.50),
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  width: 600,
                  //height: 00,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: AppColors.primaryColorLight,
                        width: .5
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50, top: 50),
                            child: Text(
                              "Location",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: AppColors.greenColor
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 100, top: 50, right: 210),
                              child: LocationDropDown(),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50, top: 50),
                            child: Text(
                              "Plot Code",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: AppColors.greenColor
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 90, top: 30, right: 210),
                              child: TextFormField(
                                style: TextStyle(
                                  color: AppColors.greenColor.withOpacity(.50),
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.greenColor.withOpacity(.50)),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.greenColor.withOpacity(.50),
                                    ),
                                  ),
                                  hintText: "345678",
                                  hintStyle: TextStyle(
                                    color: AppColors.greenColor.withOpacity(.50),
                                    fontSize: 14,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 50, top: 50),
                            child: Text(
                              "Phone Number",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: AppColors.greenColor
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 50, top: 30, right: 210),
                              child: TextFormField(
                                style: TextStyle(
                                  color: AppColors.greenColor.withOpacity(.50),
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.greenColor.withOpacity(.50)),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.greenColor.withOpacity(.50),
                                    ),
                                  ),
                                  hintText: "00971588456789",
                                  hintStyle: TextStyle(
                                    color: AppColors.greenColor.withOpacity(.50),
                                    fontSize: 14,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 50, top: 50),
                            child: Text(
                              "Attachments",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: AppColors.greenColor
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 60, top: 50),
                            child: Text(
                              "Upload Files",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                                color: Colors.transparent,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.pinkColor,
                                decorationThickness: 1,
                                shadows: [Shadow(color: AppColors.pinkColor, offset: Offset(0, -5))],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 50, top: 30),
                            child: Text(
                              "Surveyor",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: AppColors.greenColor
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 100, top: 30, right: 210),
                              child: SurveyorDropDown(),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 50, top: 30),
                            child: Text(
                              "Status",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: AppColors.greenColor
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 110, top: 30, right: 210),
                              child: StatusDropDown(),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 50, top: 50),
                            child: Text(
                              "Status Date",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: AppColors.greenColor
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 65, top: 30, right: 35),
                              child: TextFormField(
                                style: TextStyle(
                                  color: AppColors.greenColor.withOpacity(.50),
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.greenColor.withOpacity(.50)),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.greenColor.withOpacity(.50),
                                    ),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down,
                                    color: AppColors.greenColor,
                                  ),
                                  hintText: "Monday 22, July 2023",
                                  hintStyle: TextStyle(
                                    color: AppColors.greenColor.withOpacity(.50),
                                    fontSize: 14,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only( top: 50, right: 140),
                            child: Icon(
                              Icons.calendar_today,
                              color: AppColors.greenColor,
                              size: 30.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 50, top: 50),
                            child: Text(
                              "Remarks",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: AppColors.greenColor
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 80, top: 30, right: 210),
                              child: TextFormField(
                                style: TextStyle(
                                  color: AppColors.greenColor.withOpacity(.50),
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.greenColor.withOpacity(.50)),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.greenColor.withOpacity(.50),
                                    ),
                                  ),
                                  hintText: "Comments",
                                  hintStyle: TextStyle(
                                    color: AppColors.greenColor.withOpacity(.50),
                                    fontSize: 14,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.greenColor,
                          ),
                          child: const Center(
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Create Task",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      //fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
