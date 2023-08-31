import 'package:dibba_task_management/view/widget/dropdown_task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../constants/custom_colors.dart';
import '../../widget/counter_task_card.dart';
import '../../widget/search_popup.dart';
import 'counter_create_task.dart';

class CounterViewLarge extends StatefulWidget {
  const CounterViewLarge({super.key});

  @override
  State<CounterViewLarge> createState() => _CounterViewLargeState();
}

class _CounterViewLargeState extends State<CounterViewLarge> {

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
                          Text("Counter",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              //fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Text("counter@dibbamun.ae",
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
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const CounterCreateTask()),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: AppColors.dropDownArrowColor,
                                        size: 20.0,
                                      ),
                                      Text(
                                        "New Task",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Montserrat',
                                            color: AppColors.pinkColor
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 30,),
                                TaskDropDown(),
                                SizedBox(width: 30,),
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
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
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
                          padding: const EdgeInsets.only(bottom: 100),
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
