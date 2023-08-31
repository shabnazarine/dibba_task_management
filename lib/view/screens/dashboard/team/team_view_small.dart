import 'package:flutter/material.dart';

import '../../../../constants/custom_colors.dart';
import '../../../widget/team_card.dart';
import '../../surveyor/surveyor_total_task.dart';
import 'package:intl/intl.dart';

class TeamViewSmall extends StatelessWidget {
  const TeamViewSmall({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 8;
    final double itemWidth = size.width / 2;

    final DateTime today = DateTime.now();

    final DateFormat format1 = DateFormat('d');
    final DateFormat format2 = DateFormat('MMMM');

    String month = format2.format(today);
    String day = format1.format(today);

    return Scaffold(
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
                          Text("GIS Head",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              //fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Text("dibba@dibbamun.ae",
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
            Container(
              margin: EdgeInsets.only(left: 10, top: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 20, top: 20),
                    child: Text("Explore Team",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 5, right: 20),
                    height: 2,
                    color: AppColors.lineColor,
                  ),
                  SizedBox(height: 20,),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (itemWidth / itemHeight)),

                    controller: new ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    //physics: AlwaysScrollableScrollPhysics(),
                    //shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SurveyorTotalTask()),
                              );
                            },
                            child: TeamCard(name: 'GIS Head', email: 'gis_head@dibbamun.ae', totalTasks: '6',)),
                      );
                    }, ),
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
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
