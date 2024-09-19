import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poly_notepad_app/constant/colors.dart';
import '../constant/text.dart';

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
      backgroundColor: AppColor.whiteall,
      appBar: AppBar(
        backgroundColor: AppColor.appbarcolor,
        title: Text('Profile',style: largewhite),
        centerTitle: true,
      ),
      body:  Stack(
        children: [
          Container(
            height: screenHeight * 0.4,
            width: screenWidth * 1,
            color: AppColor.bodycolor,

          ),
          Positioned(
            top: 10,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network('https://scontent.fdac110-1.fna.fbcdn.net/v/t39.30808-1/421750988_913338270136654_635347076248654908_n.jpg?stp=dst-jpg_s200x200&_nc_cat=111&ccb=1-7&_nc_sid=50d2ac&_nc_ohc=lT0F270Zj6sQ7kNvgGrOmpn&_nc_ht=scontent.fdac110-1.fna&_nc_gid=AFadN_OLp_7XT6xCbiSfBjh&oh=00_AYB3F25DP5PmWCOBX8eylMQTEh_g-qz3OFNWdVjuWte0DQ&oe=66F217E6',
                      height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
                      //Text('T',style: context.textTheme.titleLarge?.copyWith(color: Colors.white, fontSize: 80))
                    ),
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
                  color: AppColor.whiteall,
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
