import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poly_notepad_app/constant/colors.dart';
import 'package:poly_notepad_app/view_screen/navigation_bar/navigation_bar.dart';
import 'package:poly_notepad_app/view_screen/home_screen/home_screen.dart';


class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  void initState(){
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Home_Screen()));

    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(child: Text('Poly Notepad App',style: context.textTheme.titleLarge?.copyWith(color: AppColor.whiteall,fontSize: 40.sp),),),
    );
  }
}
