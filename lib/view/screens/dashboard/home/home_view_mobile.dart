import 'package:flutter/material.dart';
import '../../../../constants/custom_colors.dart';
import '../../../widget/application_task_card.dart';
import '../../../widget/search_popup.dart';
import '../../../widget/team_card.dart';
import 'package:intl/intl.dart';

class HomeViewMobile extends StatefulWidget {
   const HomeViewMobile({super.key});

  @override
  State<HomeViewMobile> createState() => _HomeViewMobileState();
}

class _HomeViewMobileState extends State<HomeViewMobile> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 13;
    final double itemWidth = size.width / 2;

    final DateTime today = DateTime.now();

    final DateFormat format1 = DateFormat('d');
    final DateFormat format2 = DateFormat('MMMM');

    String month = format2.format(today);
    String day = format1.format(today);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child:  Text(month + ", " + day,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textColor,
                        //fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      )
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20, right: 20),
                      child: Column(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Assigned(23)",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            color: AppColors.pinkColor
                        ),
                      ),
                      SizedBox(width: 10,),
                      const Text(
                        "Un Assigned(13)",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            color: AppColors.redColor
                        ),
                      ),
                      SizedBox(width: 10,),
                      const Text(
                        "Completed",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            color: AppColors.orangeColor
                        ),
                      ),
                      SizedBox(width: 10,),
                      const Text(
                        "Monthly",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            color: AppColors.greenColor
                        ),
                      ),
                      //SizedBox(height: 30,),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            scrollable: true,
                            //title: Text('Login'),
                            backgroundColor: Colors.transparent,
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Form(
                                child: SearchPopUp(),
                              ),
                            ),
                          );
                        });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 15),
                    width: 92,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.greenColor,
                    ),
                    child: const Center(
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            Text(
                              "Search",
                              style: TextStyle(
                                fontSize: 13,
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
                SizedBox(height: 20,),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: (itemWidth / itemHeight)),

                  controller: new ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  //physics: AlwaysScrollableScrollPhysics(),
                  //shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: TaskCard(applicationNumber: 'Application Number', assignedPerson: 'Person 1', status: 'Pending',),
                    );
                  }, ),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 10),
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
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 20, top: 20),
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
                        crossAxisCount: 1,
                        childAspectRatio: (itemWidth / itemHeight)
                    ),

                    controller: new ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    //physics: AlwaysScrollableScrollPhysics(),
                    //shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 10, 0),
                        child: TeamCard(name: 'GIS Head', email: 'gis_head@dibbamun.ae', totalTasks: '6',),
                      );
                    }, ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Text("More",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.transparent, // Step 2 SEE HERE
                            shadows: [Shadow(offset: Offset(0, -5), color: AppColors.pinkColor)],
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
            Container(
              margin: EdgeInsets.only(left: 20, top: 20, right: 10, bottom: 20),
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
                  const Padding(
                    padding: EdgeInsets.only(left: 25, right: 20, top: 20),
                    child: Text("Explore Tasks",
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
                    height: 1,
                    color: AppColors.lineColor,
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10,bottom: 30),
                        width: itemWidth - 40,
                        height: itemHeight + 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.blueColor.withOpacity(.50),
                        ),
                        child: const Center(
                          child: Text("Today",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                //fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              )
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10,bottom: 30, right: 10),
                        width: itemWidth - 40,
                        height: itemHeight + 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.lightPinkColor.withOpacity(.80),
                        ),
                        child: const Center(
                          child: Text("Tomorrow",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                //fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10,bottom: 30),
                        width: itemWidth - 40,
                        height: itemHeight + 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.lightGreenColor.withOpacity(.50),
                        ),
                        child: const Center(
                          child: Text("This Week",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                //fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              )
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10,bottom: 30, right: 10),
                        width: itemWidth - 40,
                        height: itemHeight + 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.redColor.withOpacity(.80),
                        ),
                        child: const Center(
                          child: Text("Choose Date",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                //fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 20, right: 10, bottom: 20),
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
                  const Padding(
                    padding: EdgeInsets.only(left: 25, right: 20, top: 20),
                    child: Text("Explore Department",
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
                    height: 1,
                    color: AppColors.lineColor,
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        width: itemWidth - 40,
                        height: itemHeight + 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.redColor.withOpacity(.50),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 15),
                              child: Text("LAND SECTION",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    //fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                  )
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 10),
                              child: Text("Total Tasks : 20",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    //fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30,bottom: 30, ),
                        width: itemWidth - 40,
                        height: itemHeight + 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.redColor.withOpacity(.50),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 15),
                              child: Text("BUILDING SECTION",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    //fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                  )
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 10),
                              child: Text("Total Tasks : 10",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    //fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                  )
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 30, ),
                        width: itemWidth - 40,
                        height: itemHeight + 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.redColor.withOpacity(.50),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 15),
                              child: Text("PLANNING SECTION",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    //fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                  )
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 10),
                              child: Text("Total Tasks : 5",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    //fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30,bottom: 30),
                        width: itemWidth - 40,
                        height: itemHeight + 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.redColor.withOpacity(.50),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 15),
                              child: Text("ALL SURVEYORS",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    //fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                  )
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 10),
                              child: Text("Total Tasks : 32",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    //fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                  )
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Center(
                    child: Text("More",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.transparent, // Step 2 SEE HERE
                        shadows: [Shadow(offset: Offset(0, -5), color: AppColors.greenColor)],
                        //fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.greenColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
