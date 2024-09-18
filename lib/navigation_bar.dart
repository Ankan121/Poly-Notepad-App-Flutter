import 'package:flutter/material.dart';
import 'package:poly_notepad_app/constant/colors.dart';
import 'package:poly_notepad_app/view_screen/profile_Screen.dart';
import 'view_screen/add_screen.dart';
import 'view_screen/home_screen.dart';


class Navigation_Var extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Navigation_Var> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    Home_Screen(),
    Add_Screen(),
    Profile_Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar:
      BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.shifting, // Shifting
        selectedItemColor: AppColor.whiteall,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            backgroundColor: AppColor.navigationbarcolor,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add ',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
