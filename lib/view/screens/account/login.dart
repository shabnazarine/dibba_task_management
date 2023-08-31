import 'package:dibba_task_management/view/screens/admin/admin_home.dart';
import 'package:dibba_task_management/view/screens/dashboard/home/home.dart';
import 'package:dibba_task_management/view/screens/department/department_home.dart';
import 'package:dibba_task_management/view/screens/surveyor/surveyor_home.dart';
import 'package:flutter/material.dart';

import '../../../constants/custom_colors.dart';
import '../counter/counter_home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 600,
          height: 600,
          color: AppColors.primaryColorLight,
          child: Column(
            children: [
              //Logo
              const Padding(
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
              //Login
              const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColors.greenColor,
                    //fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              //Form
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100, top: 20),
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                  ),
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    hintText: "User Name",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100, top: 30),
                child: TextFormField(
                  obscureText: true,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                  ),
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 24.0,
                          width: 24.0,
                          child: Theme(
                            data: ThemeData(
                                unselectedWidgetColor:
                                const Color(0xffffffff)),
                            child: Checkbox(
                              activeColor: AppColors.greenColor,
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                               // value: isCheckedRememberMe,
                               /* onChanged: actionRememberMe(
                                    isCheckedRememberMe)*/
                                    ),
                          )),
                      const SizedBox(width: 10.0),
                      const Text("Remember Me",
                          style: TextStyle(
                            color: Color(0xff646464),
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                          ))
                    ]),
              ),

              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: (){
                  /*ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('A SnackBar has been shown.'),
                    ),
                  );*/
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SurveyorHome()),
                  );
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
                            "Login",
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
      ),
    );
  }
}
