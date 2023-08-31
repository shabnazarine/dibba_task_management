
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../../constants/custom_colors.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 600,
          width: 900,
          color: AppColors.primaryColorLight.withOpacity(.50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 500,
                  width: 800,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.greenColor.withOpacity(.50),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.greenColor.withOpacity(.80),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Icon( //<-- SEE HERE
                                          Icons.search,
                                          color: AppColors.pinkColor,
                                          size: 20,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(), //<-- SEE HERE
                                          padding: EdgeInsets.all(20),
                                          //backgroundColor: Colors.white.withOpacity(.80)
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      SizedBox(
                                        width: 100,
                                        child:TextFormField(
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Montserrat',
                                          ),
                                          decoration: const InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            hintText: "Search Here.....",
                                            hintStyle: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Montserrat',
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Icon( //<-- SEE HERE
                                      Icons.close,
                                      color: AppColors.pinkColor,
                                      size: 20,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(), //<-- SEE HERE
                                      padding: EdgeInsets.all(20),
                                      //backgroundColor: Colors.white.withOpacity(.80)
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          "Search Results",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 20
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: 20,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
                                child: Material(
                                  child: ListTile(
                                      tileColor: AppColors.greenColor.withOpacity(.20),
                                      trailing: Transform.rotate(
                                        angle: -math.pi / 4,
                                        child: Icon(
                                          Icons.arrow_right_alt,
                                          color: Colors.white,
                                        ),
                                      ),
                                      title: Text(
                                        "List item $index",
                                        style: TextStyle(
                                          color: AppColors.pinkColor.withOpacity(.80),
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                        ),
                                      )
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(height: 30,)
                    ],
                  )
              )
            ],
          ),
        )
      ),
    );
  }
}
