import 'dart:io';

import 'package:dibba_task_management/constants/custom_colors.dart';
import 'package:dibba_task_management/view/widget/dropdown_application_type.dart';
import 'package:dibba_task_management/view/widget/dropdown_location.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CounterCreateTask extends StatefulWidget {
  const CounterCreateTask({super.key});

  @override
  State<CounterCreateTask> createState() => _CounterCreateTaskState();
}

class _CounterCreateTaskState extends State<CounterCreateTask> {

  XFile? image;
  var img;
  late String fileName;
  bool _isShow = false;

  FilePickerResult? result;
  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }
// File Upload
  Future<void> uploadFile() async {
    result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    for (var element in result!.files) {
      //print(element.name);
      fileName = element.name;
    }
    if(result != null){
      _isShow = true;
      setState(() {});
    }
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

  //Controllers for TextFormField

  TextEditingController  dateController = TextEditingController();


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
                            padding:  EdgeInsets.only(left: 70, top: 30, right: 180),
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
                            padding: const EdgeInsets.only(left: 50, top: 30, right: 50),
                            child: TextFormField(
                              controller:  dateController,
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
                                suffixIcon: GestureDetector(
                                  onTap: () async {
                                    DateTime? pickDate = await showDatePicker(
                                        context: (context),
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2050)
                                    );
                                  },
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  ),
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
                          padding: const EdgeInsets.only( top: 50, right: 100),
                          child: GestureDetector(
                            onTap: () async {
                              DateTime? pickDate = await showDatePicker(
                                  context: (context),
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2050)
                              );
                            },
                            child: Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50, top: 30),
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
                            padding: const EdgeInsets.only(left: 50, top: 30, right: 180),
                            child: ApplicationTypeDropDown(),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 220, right: 100, bottom: 50),
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
                height: 600,
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
                            padding: const EdgeInsets.only(left: 100, top: 50, right: 200),
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
                     Row(
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
                          child: GestureDetector(
                            onTap: () async {
                             // myAlert();
                              uploadFile();
                             /* image != null
                                  ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    //to show image, you type like this.
                                    File(image!.path),
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                    height: 300,
                                  ),
                                ),
                              )
                                  : Text(
                                "No Image",
                                style: TextStyle(fontSize: 20),
                              );*/
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
                    result != null ? Padding(
                        padding: const EdgeInsets.only(left: 50, top: 40, right: 40),
                        child: Visibility(
                            visible: _isShow,
                            child: SizedBox(
                              height: 100,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: GridView.builder(
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 5,
                                          mainAxisSpacing: 10.0,
                                          crossAxisSpacing: 10.0,
                                          childAspectRatio: 4.0,
                                        ),
                                        itemCount: result?.files.length ?? 0,
                                        itemBuilder:  (BuildContext context, int index){
                                          return Text(result?.files[index].name ?? '',
                                              style: const TextStyle(
                                              color: AppColors.redColor,
                                              fontFamily: 'Montserrat',
                                              fontSize: 12,
                                                decoration: TextDecoration.underline,
                                          )
                                          );
                                        }
                                        )
                                  ),
                                ],
                              ),
                            )
                        ),
                      ) : Padding(
                        padding: const EdgeInsets.only(left: 50, top: 40),
                        child: Visibility(
                          visible: _isShow,
                          child: Text("Error!!!",
                            style: TextStyle(
                                color: AppColors.redColor
                            ),
                          ),
                        ),
                      ),
                    SizedBox(height: 20,),
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
