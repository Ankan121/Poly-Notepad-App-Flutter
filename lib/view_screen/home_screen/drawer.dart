import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:poly_notepad_app/constant/image.dart';
import 'package:poly_notepad_app/view_screen/Add_Note_Screen/add_screen.dart';
import 'package:poly_notepad_app/view_screen/profile_screen/profile_Screen.dart';

import '../../constant/text.dart';


class Drawer_Screen extends StatefulWidget {
  const Drawer_Screen({super.key});

  @override
  State<Drawer_Screen> createState() => _Drawer_ScreenState();
}

class _Drawer_ScreenState extends State<Drawer_Screen> {
  @override
  Widget build(BuildContext context) {

    final TextStyle? largewhite = TextFormate(colors: Colors.white).textLargeFormate(context);
    final TextStyle? mediumwhite = TextFormate(colors: Colors.white).textMediumFormate(context);
    final TextStyle? smallwhite = TextFormate(colors: Colors.white).textSmallFormate(context);


    return Drawer(
      backgroundColor: Colors.blue,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            accountName: Text("Ankan Biswas",style: largewhite,),
            accountEmail: Text("ankan.pro.dev@gmail.com",style: mediumwhite,),
            currentAccountPicture: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                  radius: 35,
                  backgroundImage:  ImagesClass.imagecoustom.image,
              ),
            ),
          ),
          SizedBox(height: 20,),
          ListTile(
            title:  Text('Add Notes',style: largewhite,),
            onTap: () {
              Get.to<Add_Screen>(const Add_Screen());
            },
          ),
          ListTile(
            title:  Text('Profile',style: largewhite ),
            onTap: () {
              Get.to<Profile_Screen>(const Profile_Screen());
            },
          ),
        ],
      ),
    );
  }
}
