import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'constant/text.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({super.key});

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  @override
  Widget build(BuildContext context) {

    final TextStyle? largewhite = TextFormate(colors: Colors.white).textLargeFormate(context);
    final TextStyle? mediumwhite = TextFormate(colors: Colors.white).textMediumFormate(context);
    final TextStyle? smallwhite = TextFormate(colors: Colors.white).textSmallFormate(context);

    final TextStyle? largeblack = TextFormate(colors: Colors.black).textLargeFormate(context);
    final TextStyle? mediumblack = TextFormate(colors: Colors.black).textMediumFormate(context);
    final TextStyle? smallblack = TextFormate(colors: Colors.black).textSmallFormate(context);

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Profile',style: largewhite),
        centerTitle: true,
      ),
      body:  Stack(
        children: [
          Container(
            height: screenHeight * 0.4,
            width: screenWidth * 1,
            color: Colors.blue,

          ),
          Positioned(
            top: 10,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircleAvatar(
                      radius: 50.r,
                      backgroundColor: Colors.blueGrey,
                      child: Text('T',style: context.textTheme.titleLarge?.copyWith(color: Colors.white, fontSize: 80))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Poly NotePad App',style: largewhite),
                    Text('01571258430',style: mediumwhite),
                    Text('ankan.dev.prog@gmail.com',style: mediumwhite),

                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Card(
              elevation: 5,
              child: Container(
                height: screenHeight *0.4,
                width: screenWidth * 0.9,
                //color: Colors.white,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ankan Chandra Biswas',style: largeblack),
                      Divider(color: Colors.black12,thickness: 1,),
                      Spacer(),
                      Text('ankan.dev.prog@gmail.com',style: largeblack),
                      Divider(color: Colors.black12,thickness: 1,),
                      Spacer(),
                      Text('01571258430',style: largeblack),
                      Divider(color: Colors.black12,thickness: 1,),
                      Spacer(),
                      Text('Raipura, Narsingdi',style: largeblack),
                      Divider(color: Colors.black12,thickness: 1,),
                      Spacer(),
                      TextButton(onPressed: (){
                        //Get.to(ApplyScreen());
                      }, child: Text('Logout',style: largeblack)),

                    ],),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
