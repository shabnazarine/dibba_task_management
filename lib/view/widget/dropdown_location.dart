import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';

class LocationDropDown extends StatefulWidget {
  const LocationDropDown({super.key});

  @override
  State<LocationDropDown> createState() => _LocationDropDownState();
}

class _LocationDropDownState extends State<LocationDropDown> {

  String? selectedLocation;
  List<String> location = ["Al Qiaan", "Al Muhalab", "City Center", "Al Murabaa", "Al Rashisiya", "Waset", "Al Rifaa", "Al Khazan", "Seeh Dibba", "Al Nahdah",
                           "Wam", "Al Ghob","Al Busseira", "Wadi Sina", "Al Hala", "Al Uyina", "Shermata", "Eshasah", "Wadi Al Abadila", "Al Ghoona", "Daher Al Safwa",
                           "Wadi Al Fay", "Waib Al Henna", "Al Mohtariqa", "Esh", "Dhabaa", "Dhanha", "Al Hemri", "Al Wuraiah", "Amqa", "Bidiya Industrial Area",
                            "Al Bidiya", "Nehay", "Al Jubail", "Sharm", "Al Hawabeet", "Al Aqah", "Dhadna", "Al Raheeb", "Rul Dhadna", "Al Fiqait", "Rul Dibba",
                            "Al Ras", "Dibba Industrial Area", "Al Rakbi", "Dalam", "Al Akamiya", "Al Rada", "Al Ghurfa", "Al Razqi", "Sambered"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      child: InkWell(
          onTap: () async {
            showMyAlertDialog(context);
          },
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${selectedLocation ?? 'Select'}   ",
                style: TextStyle(
                  color: AppColors.greenColor.withOpacity(.50),
                  fontFamily: 'Montserrat',
                ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.greenColor,
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
    final double itemWidth = size.width / 2;

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
                width: itemWidth - 100,
                height: 600,
                margin: EdgeInsets.only(left: 10, right: 10),
                child: GridView.count(
                    crossAxisCount: 3,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  childAspectRatio: 5,
                  children: [
                    ...List.generate(
                      location.length,
                          (index) => item(
                        text: location[index], //sent String
                        isSelected: location[index] ==
                            selectedLocation, //check it is selected or not
                        ontap: () {
                          /// for inner dialog changes
                          setStateD(() {
                            selectedLocation = location[index];
                          }
                          );
                          Navigator.of(context)
                              .pop(); // if you wish to close the dialog on Select

                          setState(() {
                            //* for class state changes
                            selectedLocation = location[index];
                          });
                        },
                      ),
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
            Text(text,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            if (isSelected)
              const Icon(
                  Icons.check,
              color: Colors.white,
              ), // show only check while it is selected, or you can use the same logic on Main row item
          ],
        ),
      ),
    );
  }
}
