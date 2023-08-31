import 'package:dibba_task_management/constants/custom_colors.dart';
import 'package:dibba_task_management/view/widget/dropdown_application_type.dart';
import 'package:dibba_task_management/view/widget/dropdown_location.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../widget/dropdown_application_type_mobile.dart';
import '../../widget/dropdown_location_mobile.dart';

class CounterCreateTaskMobile extends StatefulWidget {
  const CounterCreateTaskMobile({super.key});

  @override
  State<CounterCreateTaskMobile> createState() => _CounterCreateTaskMobileState();
}

class _CounterCreateTaskMobileState extends State<CounterCreateTaskMobile> {

  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

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
                  //width: 600,
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
                          "Create New Task",
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
                            padding: EdgeInsets.only(left: 30, top: 50),
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
                              padding:  EdgeInsets.only(left: 50, top: 30, right: 50),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.50),
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white.withOpacity(.50)),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white.withOpacity(.50)
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
                            padding: const EdgeInsets.only(left: 30, top: 50),
                            child: Text(
                              "Submission Date",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: Colors.white
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.50),
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white.withOpacity(.50)),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white.withOpacity(.50),
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
                            padding: const EdgeInsets.only( top: 50, right: 10),
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
                            padding: const EdgeInsets.only(left: 30, top: 40),
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
                              padding: const EdgeInsets.only(left: 30, top: 40, right: 50),
                              child: ApplicationTypeDropDownMobile(),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 180, right: 50),
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white.withOpacity(.50),
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white.withOpacity(.50)),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(.50),
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
                  margin: EdgeInsets.only(bottom: 50, left: 1, right: 1),
                 // width: 600,
                 // height: 600,
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
                            padding: const EdgeInsets.only(left: 30, top: 50),
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
                              padding: const EdgeInsets.only(left: 80, top: 50, right: 50),
                              child: LocationDropDownMobile(),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30, top: 50),
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
                              padding: const EdgeInsets.only(left: 70, top: 30, right: 50),
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
                            padding: EdgeInsets.only(left: 30, top: 50),
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
                              padding: const EdgeInsets.only(left: 30, top: 30, right: 50),
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
                       Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30, top: 50),
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
                            padding: EdgeInsets.only(left: 40, top: 50),
                            child: GestureDetector(
                              onTap: (){
                                myAlert();
                                image != null
                                    ? print("Image path")  : print("Error");
                              },
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
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
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
                      const SizedBox(
                        height: 50,
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
