import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';

class ApplicationTypeDropDownMobile extends StatefulWidget {
  const ApplicationTypeDropDownMobile({super.key});

  @override
  State<ApplicationTypeDropDownMobile> createState() => _ApplicationTypeDropDownMobileState();
}

class _ApplicationTypeDropDownMobileState extends State<ApplicationTypeDropDownMobile> {

  bool isSelected = false;

  String? selectedApplicationType;

  List<String> planning = ["Request for New Street Plan", "Request for New Land Plan", "Request a Service Path", "Addition", "Build In Farm", "Site Visit"];
  List<String> building = ["Certificate of Completion", "Electricity & Water Connection Letter Request", "Illegal Construction", "Old & New Construction", "Site Visit"];
  List<String> land = ["Milkiya Drawing", "Milkiya Renew", "Milkiya Drawing with New Number", "Old Farm Survey", "Violation Report", "Consultant Drawing", "Site Visit"];
  List<String> survey = ["Shed Permit", "Interlock permit", "Reclamation", "Tent", "Septic Tank", "Demarcation", "Demarcation Verification", "Insurance Refund",
    "Gate Level", "Etisalat Cable Route", "Electric Cable Route", "Water Pipeline", "Preliminary Approval of Drawing", "Tie Beam Level", "Site Visit"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 550,
      child: InkWell(
          onTap: () async {
            showMyAlertDialog(context);
          },
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text("${selectedApplicationType ?? 'Select'}   ",
                    style: TextStyle(
                      color: Colors.white.withOpacity(.50),
                      fontFamily: 'Montserrat',
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    // textDirection: TextDirection.rtl,
                    // textAlign: TextAlign.justify,
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
              ],
            ),
          )
        //  DropdownButtonFormField(
        //   items: [],
        //   hint: Text("Select"),
        // ),
      ),
    );
  }

  showMyAlertDialog(BuildContext context) {

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 4;
    final double itemWidth = size.width;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.greenColor.withOpacity(.50),
          scrollable: true,
          content: StatefulBuilder(
            //* dialog is on different widget Tree. check dev-tools
            builder: (context, setStateD) {
              return Container(
                width: itemWidth,
                //height: 600,
                child: Column(
                  children: [
                    ExpansionTile(
                      title: Text("Planning Section",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      shape: Border.all(color: Colors.transparent),
                      children: [
                        ...List.generate(
                          planning.length,
                              (index) => item(
                            text: planning[index], //sent String
                            isSelected: planning[index] ==
                                selectedApplicationType, //check it is selected or not
                            ontap: () {
                              /// for inner dialog changes
                              setStateD(() {
                                selectedApplicationType = planning[index];
                              }
                              );
                              Navigator.of(context)
                                  .pop(); // if you wish to close the dialog on Select

                              setState(() {
                                //* for class state changes
                                selectedApplicationType = planning[index];
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: Text("Building Section",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      shape: Border.all(color: Colors.transparent),
                      children: [
                        ...List.generate(
                          building.length,
                              (index) => item(
                            text: building[index], //sent String
                            isSelected: building[index] ==
                                selectedApplicationType, //check it is selected or not
                            ontap: () {
                              /// for inner dialog changes
                              setStateD(() {
                                selectedApplicationType = building[index];
                              }
                              );
                              Navigator.of(context)
                                  .pop(); // if you wish to close the dialog on Select

                              setState(() {
                                //* for class state changes
                                selectedApplicationType = building[index];
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: Text("Land Section",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      shape: Border.all(color: Colors.transparent),
                      children: [
                        ...List.generate(
                          land.length,
                              (index) => item(
                            text: land[index], //sent String
                            isSelected: land[index] ==
                                selectedApplicationType, //check it is selected or not
                            ontap: () {
                              /// for inner dialog changes
                              setStateD(() {
                                selectedApplicationType = land[index];
                              }
                              );
                              Navigator.of(context)
                                  .pop(); // if you wish to close the dialog on Select

                              setState(() {
                                //* for class state changes
                                selectedApplicationType = land[index];
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: Text("Survey Section",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      shape: Border.all(color: Colors.transparent),
                      children: [
                        ...List.generate(
                          survey.length,
                              (index) => item(
                            text: survey[index], //sent String
                            isSelected: survey[index] ==
                                selectedApplicationType, //check it is selected or not
                            ontap: () {
                              /// for inner dialog changes
                              setStateD(() {
                                selectedApplicationType = survey[index];
                              }
                              );
                              Navigator.of(context)
                                  .pop(); // if you wish to close the dialog on Select

                              setState(() {
                                //* for class state changes
                                selectedApplicationType = survey[index];
                              });
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget item(
      {required String text,
        required bool isSelected,
        required Function ontap}) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 4,
      ),
      child: InkWell(
        onTap: () => ontap(),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text(text,
                style: TextStyle(
                  color: AppColors.blueColor,
                  fontFamily: 'Montserrat',
                  fontSize: 12
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            if (isSelected)
              const Icon(
                Icons.check,
                color: Colors.white,
                size: 12,
              ), // show only check while it is selected, or you can use the same logic on Main row item
          ],
        ),
      ),
    );
  }

}
