import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/custom_colors.dart';
import '../screens/department/department_view_task.dart';
import '../screens/surveyor/surveyor_task_update.dart';

class SurveyorTaskCard extends StatelessWidget {

  const SurveyorTaskCard({required this.applicationNumber, this.onTap, required this.taskType, required this.taskStatus});
  final String applicationNumber;
  final String taskType;
  final String taskStatus;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    //var theme = ThemeProvider.controllerOf(context).theme.data;
    return SizedBox(
      child: Card(
          elevation: 2.0,
          shadowColor: Colors.black26,
          color: AppColors.pinkColor.withOpacity(.50),
          margin: EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Container(

                  //width: MediaQuery.of(context). size. width-600,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5)
                      ),
                      color: Colors.white
                  ),

                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              applicationNumber,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                //fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, top: 20),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SurveyorUpdateTask()),
                                );
                              },
                              child: Icon(
                                Icons.edit,
                                color: AppColors.textColor.withOpacity(.41),
                                size: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Text("Application Type :" +taskType,
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 13,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const DepartmentViewTask()),
                                );
                              },
                              child: Text("View Task",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.transparent, // Step 2 SEE HERE
                                  shadows: [Shadow(offset: Offset(0, -5), color: AppColors.pinkColor)],
                                  //fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.pinkColor,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 92,
                            height: 27,
                            margin: EdgeInsets.only(left: 40, bottom: 10, top: 20, right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.lightGreenColor.withOpacity(.5),
                            ),
                            child: Center(
                              child: Text(
                                taskStatus,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: AppColors.cardTextColor,
                                  //fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}