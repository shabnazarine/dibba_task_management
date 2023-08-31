
import 'package:flutter/material.dart';
import '../../../../constants/custom_colors.dart';
import '../../../../constants/page_titles.dart';
import '../../test_screen.dart';
import '../search/search.dart';
import '../settings/settings.dart';
import '../task/tasks.dart';
import '../team/team.dart';

import 'home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  late TabController tabController;
  int active = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, initialIndex: 0, length: 6)
      ..addListener(() {
        setState(() {
          active = tabController.index;
        });
      });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
       /* actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 10),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("GIS Head",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    Text("dibba@dibbamun.ae",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    )
                  ],
                ),
                Container(
                    width: 35.0,
                    height: 35.0,
                    margin: EdgeInsets.only(left: 20,),
                    decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image:  AssetImage("assets/images/img.png")
                        )
                    )
                ),
                Container()
              ],
            ),
          )
        ],*/
      ),
      body: Row(
        children:[
          MediaQuery.of(context).size.width < 1300
              ? Container()
              : Card(
            //elevation: 2.0,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: 256,
                color: AppColors.primaryColorLight,
                child: listDrawerItems(false)),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width < 1300
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width - 310,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const [
                HomePage(),
                TaskPage(),
                TeamPage(),
                SearchPage(),
                SettingsPage(),
                TestClass()// HeroAnimation(),
              ],
            ),
          )
        ],
      ),
      drawer: Padding(
          padding: EdgeInsets.only(top: 56),
          child: Drawer(
            backgroundColor: AppColors.primaryColorLight,
              child: listDrawerItems(true),
          )
      ),
    );
  }

  Widget listDrawerItems(bool drawerStatus) {
    return ListView(
      children: [
        TextButton(
          //color: tabController.index == 1 ? Colors.grey[100] : Colors.white,
          onPressed: () {
            print(tabController.index);
            tabController.animateTo(0);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(top: 22, bottom: 22, right: 22),
              child: Row(children: [
                Icon(Icons.home,
                  color: tabController.index == 0 ? AppColors.pinkColor : Colors.white,),
                SizedBox(
                  width: 8,
                ),
                Text(
                  PageTitles.home,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    color: tabController.index == 0 ? AppColors.pinkColor : Colors.white,
                  ),
                ),
              ]),
            ),
          ),
        ),
        TextButton(
          //color: tabController.index == 2 ? Colors.grey[100] : Colors.white,
          onPressed: () {
            tabController.animateTo(1);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.only(top: 22, bottom: 22, right: 22),
              child: Row(children: [
                Icon(Icons.task,
                  color: tabController.index == 1 ? AppColors.pinkColor : Colors.white,),
                SizedBox(
                  width: 8,
                ),
                Text(
                  PageTitles.task,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    color: tabController.index == 1 ? AppColors.pinkColor : Colors.white,
                  ),
                ),
              ]),
            ),
          ),
        ),
        TextButton(
          //color: tabController.index == 2 ? Colors.grey[100] : Colors.white,
          onPressed: () {
            tabController.animateTo(2);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.only(top: 22, bottom: 22, right: 22),
              child: Row(children: [
                Icon(Icons.people,
                  color: tabController.index == 2 ? AppColors.pinkColor : Colors.white,),
                SizedBox(
                  width: 8,
                ),
                Text(
                  PageTitles.team,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                    color: tabController.index == 2 ? AppColors.pinkColor : Colors.white,
                  ),
                ),
              ]),
            ),
          ),
        ),
        TextButton(
          // color: tabController.index == 0 ? Colors.grey[100] : Colors.white,
          // color: Colors.grey[100],
          style: const ButtonStyle(
            //backgroundColor: MaterialStatePropertyAll(AppColors.primaryColorLight),
            //backgroundColor: tabController.index == 0 ? Colors.grey[100] : Colors.white,
          ),
          onPressed: () {
            tabController.animateTo(3);
            drawerStatus ? Navigator.pop(context) : print("");
          },

          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.only(top: 22, bottom: 22, right: 22),
              child: Row(children: [
                Icon(Icons.search,
                  color: tabController.index == 3 ? AppColors.pinkColor : Colors.white,
                  //color: tabController.index == 0 ? AppColors.pinkColor : Colors.white,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  PageTitles.search,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                    color: tabController.index == 3 ? AppColors.pinkColor : Colors.white,
                  ),
                ),
              ]),
            ),
          ),
        ),


        TextButton(
          //color: tabController.index == 2 ? Colors.grey[100] : Colors.white,
          onPressed: () {
            tabController.animateTo(5);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Align(

            child: Container(
              padding: const EdgeInsets.only(top: 22, bottom: 22, right: 22),
              child: Row(children: [
                Icon(Icons.logout,
                  color: tabController.index == 5 ? AppColors.pinkColor : Colors.white,),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    color: tabController.index == 5 ? AppColors.pinkColor : Colors.white,
                  ),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }

}


