import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';

class UserProfileCard extends StatelessWidget {

  final String name;
  final String email;
  final String designation;
  final GestureTapCallback? onTap;

  const UserProfileCard({super.key, required this.name, required this.email, required this.designation, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 2.0,
        shadowColor: Colors.black26,
        color: Colors.white,
        margin: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      width: 47,
                      height: 50,
                      decoration:  const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image:  AssetImage("assets/images/img.png")
                          )
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(name,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.greenColor,
                            //fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(email,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            //fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(designation,
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.pinkColor,
                            //fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 92,
                          height: 27,
                          margin: EdgeInsets.only(left: 40, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.pinkColor.withOpacity(.2),
                          ),
                          child: Center(
                            child: Text(
                              "View",
                              style: TextStyle(
                                fontSize: 11,
                                color: AppColors.cardTextColor,
                                //fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 92,
                          height: 27,
                          margin: EdgeInsets.only(left: 40, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.greenColor.withOpacity(.2),
                          ),
                          child: Center(
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                fontSize: 11,
                                color: AppColors.cardTextColor,
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
              )
            ],
          ),
        ),
      )
    );
  }
}
