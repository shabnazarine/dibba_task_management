import 'package:dibba_task_management/constants/custom_colors.dart';
import 'package:dibba_task_management/view/widget/dropdown_department.dart';
import 'package:dibba_task_management/view/widget/dropdown_designation.dart';
import 'package:flutter/material.dart';

class CreateNewUser extends StatefulWidget {
  const CreateNewUser({super.key});

  @override
  State<CreateNewUser> createState() => _CreateNewUser();
}

class _CreateNewUser extends State<CreateNewUser> {
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
                  height: 400,
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
                          "Create New User",
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
                              "First Name",
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
                                  hintText: "First name",
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
                              "Last Name",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: Colors.white
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 60, top: 30, right: 200),
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
                                  hintText: "Last Name",
                                  hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(.50),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 50, top: 40),
                            child: Text(
                              "Designation",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: Colors.white
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 50, top: 40, right: 200),
                              child: DesignationDropDown(),
                            ),
                          ),
                        ],
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
                            padding: const EdgeInsets.only(left: 50, top: 40),
                            child: Text(
                              "Department",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: AppColors.greenColor
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 60, top: 40, right: 210),
                              child: DepartmentDropDown(),
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
                              "Email",
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
                              child: TextFormField(
                                style: TextStyle(
                                  color: AppColors.greenColor.withOpacity(.50),
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.greenColor.withOpacity(.5)),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.greenColor.withOpacity(.50),
                                    ),
                                  ),
                                  hintText: "123@gmail.com",
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
                            padding: EdgeInsets.only(left: 50, top: 40),
                            child: Text(
                              "User Name",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: AppColors.greenColor
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 60, top: 30, right: 210),
                              child: TextFormField(
                                style: TextStyle(
                                  color: AppColors.greenColor.withOpacity(.50),
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.greenColor.withOpacity(.5)),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.greenColor.withOpacity(.50),
                                    ),
                                  ),
                                  hintText: "User Name",
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
                            padding: EdgeInsets.only(left: 50, top: 40),
                            child: Text(
                              "Password",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: AppColors.greenColor
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 70, top: 30, right: 210),
                              child: TextFormField(
                                obscureText: true,
                                style: TextStyle(
                                  color: AppColors.greenColor.withOpacity(.50),
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.greenColor.withOpacity(.5)),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.greenColor.withOpacity(.50),
                                    ),
                                  ),
                                  hintText: "Password",
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
                            padding: EdgeInsets.only(left: 50, top: 40),
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
                              padding: const EdgeInsets.only(left: 30, top: 30, right: 210),
                              child: TextFormField(
                                style: TextStyle(
                                  color: AppColors.greenColor.withOpacity(.50),
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.greenColor.withOpacity(.5)),
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
                            padding: EdgeInsets.only(left: 50, top: 40),
                            child: Text(
                              "Profile Picture",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: AppColors.greenColor
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 35, top: 50),
                            child: Text(
                              "Upload",
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
                      const SizedBox(
                        height: 40,
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
                                    "Create User",
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
