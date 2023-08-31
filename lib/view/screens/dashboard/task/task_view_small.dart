import 'package:dibba_task_management/view/widget/dropdown_task.dart';
import 'package:dibba_task_management/view/widget/dropdown_task_monitor.dart';
import 'package:flutter/material.dart';

import '../../../../constants/custom_colors.dart';
import '../../../widget/search_popup.dart';
import '../../../widget/task_card.dart';
import '../../../widget/task_tile.dart';
import 'package:intl/intl.dart';

class TaskViewSmall extends StatelessWidget {
  const TaskViewSmall({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 7;
    final double itemWidth = size.width / 1.5;

    final DateTime today = DateTime.now();

    final DateFormat format1 = DateFormat('d');
    final DateFormat format2 = DateFormat('MMMM');

    String month = format2.format(today);
    String day = format1.format(today);

    return Scaffold(
      body: SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
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
           Column(
             children: [
               Padding(
                 padding: const EdgeInsets.only(left: 20,top: 20, right: 20, bottom: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     const Text(
                       "Tasks",
                       style: TextStyle(
                           fontSize: 30,
                           fontFamily: 'Montserrat',
                           color: Colors.black
                       ),
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
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
                             width: 120,
                             height: 40,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(20),
                               color: AppColors.greenColor,
                             ),
                             child: Center(
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
                                       "Search Task",
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
                         SizedBox(width: 30,),
                         TaskDropDown()
                       ],
                     )
                   ],
                 ),
               ),
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
                 itemCount: 4,
                 itemBuilder: (context, index){
                   return Padding(
                     padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                     child: TaskDetailCard(applicationNumber: 'Application Number', taskType: 'Interlock Permit', taskStatus: 'Accepted', ),
                   );
                 }, ),
               SizedBox(height: 20,),
               Center(
                 child: Padding(
                   padding: const EdgeInsets.only(bottom: 20),
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
           Container(
             margin: EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 20),
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
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               // crossAxisAlignment: CrossAxisAlignment.sp,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Padding(
                       padding: EdgeInsets.only(left: 50, right: 20, top: 20),
                       child: Text("Task Monitoring",
                           style: TextStyle(
                             fontSize: 15,
                             color: Colors.black,
                             //fontWeight: FontWeight.bold,
                             fontFamily: 'Montserrat',
                           )
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(right: 20),
                       child: MonitorTaskDropDown(),
                     )
                   ],
                 ),
                 Container(
                   margin: EdgeInsets.only(left: 20, top: 5, right: 20),
                   height: 2,
                   color: AppColors.lineColor,
                 ),
                 SizedBox(height: 20,),
                 Padding(
                   padding: const EdgeInsets.only(right: 10),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Stack(
                             children: [
                               Container(
                                 margin: EdgeInsets.only(left: 20, bottom: 10),
                                 height: 45,
                                 width: itemWidth/3.9,
                                 color: AppColors.primaryColor.withOpacity(.80),

                               ),
                               Container(
                                 margin: EdgeInsets.only(left: 20, bottom: 10, top: 5),
                                 height: 41,
                                 width: itemWidth/3.9,
                                 decoration: BoxDecoration(
                                   color: Colors.white,
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.grey.withOpacity(0.5),
                                       spreadRadius: 1,
                                       blurRadius: 4,
                                       offset: Offset(0, 3), // changes position of shadow
                                     ),
                                   ],
                                 ),
                                 child: Center(
                                   child: Text(
                                     "In Progress",
                                     style: TextStyle(
                                       fontSize: 14,
                                       color: AppColors.primaryColor,
                                       //fontWeight: FontWeight.bold,
                                       fontFamily: 'Montserrat',
                                     ),
                                   ),
                                 ),
                               )
                             ],
                           ),
                         ],
                       ),
                       //SizedBox(width: 20,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Stack(
                             children: [
                               Container(
                                 margin: EdgeInsets.only(bottom: 10),
                                 height: 45,
                                 width: itemWidth/3.9,
                                 color: AppColors.redColor.withOpacity(.80),

                               ),
                               Container(
                                 margin: EdgeInsets.only(bottom: 10, top: 5),
                                 height: 41,
                                 width: itemWidth/3.9,
                                 decoration: BoxDecoration(
                                   color: Colors.white,
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.grey.withOpacity(0.5),
                                       spreadRadius: 1,
                                       blurRadius: 4,
                                       offset: Offset(0, 3), // changes position of shadow
                                     ),
                                   ],
                                 ),
                                 child: Center(
                                   child: Text(
                                     "Review",
                                     style: TextStyle(
                                       fontSize: 14,
                                       color: AppColors.redColor,
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
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Stack(
                             children: [
                               Container(
                                 margin: EdgeInsets.only(bottom: 10),
                                 height: 45,
                                 width: itemWidth/3.9,
                                 color: AppColors.pinkColor.withOpacity(.50),

                               ),
                               Container(
                                 margin: EdgeInsets.only(bottom: 10, top: 5),
                                 height: 41,
                                 width: itemWidth/3.9,
                                 decoration: BoxDecoration(
                                   color: Colors.white,
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.grey.withOpacity(0.5),
                                       spreadRadius: 1,
                                       blurRadius: 4,
                                       offset: Offset(0, 3), // changes position of shadow
                                     ),
                                   ],
                                 ),
                                 child: Center(
                                   child: Text(
                                     "Completed",
                                     style: TextStyle(
                                       fontSize: 14,
                                       color: AppColors.pinkColor,
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
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Stack(
                             children: [
                               Container(
                                 margin: EdgeInsets.only(bottom: 10, right: 20),
                                 height: 45,
                                 width: itemWidth/3.9,
                                 color: AppColors.blueColor.withOpacity(.50),

                               ),
                               Container(
                                 margin: EdgeInsets.only(bottom: 10, top: 5, right: 20),
                                 height: 41,
                                 width: itemWidth/3.9,
                                 decoration: BoxDecoration(
                                   color: Colors.white,
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.grey.withOpacity(0.5),
                                       spreadRadius: 1,
                                       blurRadius: 4,
                                       offset: Offset(0, 3), // changes position of shadow
                                     ),
                                   ],
                                 ),
                                 child: Center(
                                   child: Text(
                                     "Pending",
                                     style: TextStyle(
                                       fontSize: 14,
                                       color: AppColors.blueColor,
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
                       //SizedBox(width: 20,),
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(right: 10),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Container(
                           margin: EdgeInsets.only( left: 20, bottom: 20),
                           // height: 45,
                           width: itemWidth/3.9,
                           color: AppColors.taskTileColor.withOpacity(.10),
                           child: Column(
                             children: [
                               GridView.builder(
                                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                     crossAxisCount: 1,
                                     childAspectRatio: (itemWidth / itemHeight) /3.45
                                 ),

                                 controller: new ScrollController(keepScrollOffset: false),
                                 shrinkWrap: true,
                                 scrollDirection: Axis.vertical,
                                 //physics: AlwaysScrollableScrollPhysics(),
                                 //shrinkWrap: true,
                                 itemCount: 8,
                                 itemBuilder: (context, index){
                                   return Padding(
                                       padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                       child: TaskTile()
                                   );
                                 }, ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 10, bottom: 10),
                                 child: Icon(
                                   Icons.more_horiz,
                                   color: Colors.black,
                                   size: 20.0,
                                 ),
                               ),
                             ],
                           )
                       ),
                       //SizedBox(width: 20,),
                       Container(
                           margin: EdgeInsets.only(  bottom: 20),
                           width: itemWidth/3.9,
                           color: AppColors.taskTileColor.withOpacity(.10),
                           child: Column(
                             children: [
                               GridView.builder(
                                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                     crossAxisCount: 1,
                                     childAspectRatio: (itemWidth / itemHeight) /3.45
                                 ),

                                 controller: new ScrollController(keepScrollOffset: false),
                                 shrinkWrap: true,
                                 scrollDirection: Axis.vertical,
                                 //physics: AlwaysScrollableScrollPhysics(),
                                 //shrinkWrap: true,
                                 itemCount: 4,
                                 itemBuilder: (context, index){
                                   return Padding(
                                       padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                       child: TaskTile()
                                   );
                                 }, ),
                             ],
                           )
                       ),
                       Container(
                           margin: EdgeInsets.only(bottom: 20),
                           width: itemWidth/3.9,
                           color: AppColors.taskTileColor.withOpacity(.10),
                           child: Column(
                             children: [
                               GridView.builder(
                                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                     crossAxisCount: 1,
                                     childAspectRatio: (itemWidth / itemHeight) /3.45
                                 ),

                                 controller: new ScrollController(keepScrollOffset: false),
                                 shrinkWrap: true,
                                 scrollDirection: Axis.vertical,
                                 //physics: AlwaysScrollableScrollPhysics(),
                                 //shrinkWrap: true,
                                 itemCount: 1,
                                 itemBuilder: (context, index){
                                   return Padding(
                                       padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                       child: TaskTile()
                                   );
                                 }, ),
                             ],
                           )
                       ),
                       Container(
                           margin: EdgeInsets.only(bottom: 20, right: 20),
                           //height: 45,
                           width: itemWidth/3.9,
                           color: AppColors.taskTileColor.withOpacity(.10),
                           child: Column(
                             children: [
                               GridView.builder(
                                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                     crossAxisCount: 1,
                                     childAspectRatio: (itemWidth / itemHeight) /3.45
                                 ),

                                 controller: new ScrollController(keepScrollOffset: false),
                                 shrinkWrap: true,
                                 scrollDirection: Axis.vertical,
                                 //physics: AlwaysScrollableScrollPhysics(),
                                 //shrinkWrap: true,
                                 itemCount: 4,
                                 itemBuilder: (context, index){
                                   return Padding(
                                       padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                       child: TaskTile()
                                   );
                                 }, ),
                             ],
                           )
                       ),
                       //SizedBox(width: 20,),
                     ],
                   ),
                 ),
               ],
             ),
           )
         ],
       ),
      ),
    );
  }
}
