
import 'package:flutter/material.dart';

import '../../../constants/custom_colors.dart';
import '../../widget/counter_task_card.dart';
import 'package:intl/intl.dart';


class SurveyorTotalTask extends StatefulWidget {
  const SurveyorTotalTask({super.key});

  @override
  State<SurveyorTotalTask> createState() => _SurveyorTotalTask();
}

class _SurveyorTotalTask extends State<SurveyorTotalTask> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 1.7;
    final double itemWidth = size.width / 1.5;

    final DateTime today = DateTime.now();

    final DateFormat format1 = DateFormat('d');
    final DateFormat format2 = DateFormat('MMMM');

    String month = format2.format(today);
    String day = format1.format(today);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColorLight,
        automaticallyImplyLeading:
        MediaQuery.of(context).size.width < 1300 ? true : false,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              Container(
                alignment: Alignment.centerLeft,
                //margin: const EdgeInsets.only(left: 2),
                width: 256,
                height: 58.5,
                //color: AppColors.primaryColorLight,
                child: Row(
                  children: [
                    Image(image: AssetImage("assets/images/logo.png"),
                      width: 35,
                      height: 45,
                    ),
                    const Text(
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
            ]),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(month + ", " + day,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textColor,
                        //fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      )
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, right: 20),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Surveyor",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              //fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Text("survey@dibbamun.ae",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              //fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        width: 35,
                        height: 35,
                        margin: const EdgeInsets.only(top: 20,right: 20),
                        decoration:  const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image:  AssetImage("assets/images/img.png")
                            )
                        )
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 5, right: 20),
              height: 2,
              color: AppColors.lineColor,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50, top: 20, right: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "All Tasks",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Montserrat',
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: (itemWidth / itemHeight) / .6
                          ),

                          controller: new ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          //physics: AlwaysScrollableScrollPhysics(),
                          //shrinkWrap: true,
                          itemCount: 15,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: CounterTaskCard(applicationNumber: 'Application Number',taskType: 'Milkiya Drawing', taskStatus: 'Accepted', ),
                            );
                          }, ),
                      ),
                      SizedBox(height: 20,),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: Text("More",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.transparent, // Step 2 SEE HERE
                                shadows: [Shadow(offset: Offset(0, -5), color: AppColors.greenColor)],
                                //fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.greenColor,
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 25,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
