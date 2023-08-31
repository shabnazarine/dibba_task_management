import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants/custom_colors.dart';
import '../../widget/user_profile_card.dart';
import '../surveyor/surveyor_total_task.dart';
import 'package:intl/intl.dart';

import 'create_new_user.dart';

class AdminViewLarge extends StatefulWidget {
  const AdminViewLarge({super.key});

  @override
  State<AdminViewLarge> createState() => _AdminViewLargeState();
}

class _AdminViewLargeState extends State<AdminViewLarge> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 4;
    final double itemWidth = size.width / 2;

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
                /* const Text("July, 23",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textColor,
                  //fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),)*/
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
                            Text("Admin",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                //fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            Text("admin@dibbamun.ae",
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                                //fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Logout",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                color: Colors.transparent,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.pinkColor,
                                decorationThickness: 1,
                                shadows: [Shadow(color: AppColors.pinkColor, offset: Offset(0, -5))],
                              ),
                            ),
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
                margin: EdgeInsets.only(left: 50, top: 20, right: 20),
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
                      padding: EdgeInsets.only(left: 50, right: 20, top: 20),
                      child: Text("Explore Users",
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
                          crossAxisCount: 3,
                          childAspectRatio: (itemWidth / itemHeight)
                      ),

                      controller: new ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      //physics: AlwaysScrollableScrollPhysics(),
                      //shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(40, 30, 10, 0),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SurveyorTotalTask()),
                                );
                              },
                              child: UserProfileCard(name: 'Santhosh', email: 'santhosh@dibbamun.ae', designation: 'Senior Surveyor',)),
                        );
                      }, ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
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
                    Container(
                      margin: EdgeInsets.only(bottom: 20, right: 20),
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CreateNewUser()),
                          );
                        },
                        backgroundColor: AppColors.greenColor,
                        child: Icon(Icons.add,
                          color: Colors.white,),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50,),
            ],
          ),
        )
    );
  }
}
