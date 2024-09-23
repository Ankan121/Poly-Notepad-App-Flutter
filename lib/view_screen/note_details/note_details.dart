import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poly_notepad_app/constant/colors.dart';
import 'package:get/get.dart';
import 'package:poly_notepad_app/view_screen/home_screen/home_screen.dart';

import '../../constant/text.dart';

class Note_Details extends StatefulWidget {
  const Note_Details({super.key, this.title, this.description, this.backgroundcolor});
  final String? title;
  final String? description;
  final Color? backgroundcolor;

  @override
  State<Note_Details> createState() => _Note_DetailsState();
}

class _Note_DetailsState extends State<Note_Details> {
  @override
  Widget build(BuildContext context) {


    final TextStyle? largewhite = TextFormate(colors: Colors.white).textLargeFormate(context);
    final TextStyle? mediumwhite = TextFormate(colors: Colors.white).textMediumFormate(context);
    final TextStyle? smallwhite = TextFormate(colors: Colors.white).textSmallFormate(context);

    final TextStyle? largeblack = TextFormate(colors: Colors.black).textLargeFormate(context);
    final TextStyle? mediumblack = TextFormate(colors: Colors.black).textMediumFormate(context);
    final TextStyle? smallblack = TextFormate(colors: Colors.black).textSmallFormate(context);


    return Scaffold(
      backgroundColor: AppColor.bodycolor,
      appBar: AppBar(
        leading: IconButton(onPressed: (){Get.offAll<Home_Screen>(const Home_Screen());}, icon: Icon(Icons.arrow_back_rounded,color: Colors.white,)),
        backgroundColor: AppColor.appbarcolor,
        title: Text('Note Details',style: largewhite,),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text('Date:- 06-23-2024',style: largewhite,)),
          ),
          Container(
            padding:  EdgeInsets.all(20.0),
            height: 591.h,
            width: double.infinity.w,
            decoration: BoxDecoration(
              color: widget.backgroundcolor,
              border: Border.all(color: Colors.white,width: 3.0),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                  topLeft: Radius.circular(40)
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Title',style: context.textTheme.titleLarge?.copyWith(color: Colors.black,decoration: TextDecoration.underline ),),
                  Text('${widget.title}',style: largeblack,),
                  SizedBox(height: 10,),
                  Text('Description',style: context.textTheme.titleLarge?.copyWith(color: Colors.black,decoration: TextDecoration.underline ),),
                  Text('${widget.description}',style: mediumblack,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
