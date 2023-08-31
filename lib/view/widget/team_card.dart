import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';

class TeamCard extends StatelessWidget {

  final String name;
  final String email;
  final String totalTasks;
  final GestureTapCallback? onTap;

  const TeamCard({super.key, required this.name, required this.email, required this.totalTasks, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Column(
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
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Text(totalTasks + " Tasks",
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.pinkColor,
                    //fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
