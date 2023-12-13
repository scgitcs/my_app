import 'package:flutter/material.dart';
import 'package:my_app/DewPoint.dart';
import 'package:my_app/MachineInfo.dart';
import 'package:my_app/MachinePage.dart';
import 'package:my_app/waterPage.dart';

class Nav extends StatefulWidget {
  @override
  State<Nav> createState() {
    return _NavState();
  }
}

class _NavState extends State<Nav> { 
  int myCurrentIndex = 0;
  // List Pages = const[
  //   MachineStatus(),
  //   WaterGenerate(),
  //   // DewPoint(),
  //   // MachineInfo(),
  // ];
  List pages = const [
    MachineStatusPage(),
    waterPage(),
    DewPoint(),
    MachineInfo(),
    // MachinePage(),
    // WaterPage(),
    // DewPoint(),
    // MachineInfo(),
  ];
  // void onClicked(int index) {
  //   setState(() {
  //     myCurrentIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // Widget activePage = const MachineStatusPage();
    // if (_selectedPageIndex == 1){
    //   activePage = WaterGenaratePage();
    // }
    return Scaffold(
      bottomNavigationBar:
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40,),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 25,
            ),
          ]
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.black,
          currentIndex: myCurrentIndex,
          onTap: (index) {
            setState(() {
              myCurrentIndex = index;
            });
          },
          items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.power),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.water),
            label: 'Water',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dew_point),
            label: 'Dew Point',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Chassis Info',
          ),
        ],),
      ),
      body: pages[myCurrentIndex],
      // activePage,
    );
  }
}