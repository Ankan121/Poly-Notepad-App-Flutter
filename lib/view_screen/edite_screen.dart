import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poly_notepad_app/constant/colors.dart';
import 'package:poly_notepad_app/constant/text.dart';
import 'package:poly_notepad_app/db_service/db_herper.dart';


class edite_Screen extends StatefulWidget {
  const edite_Screen({super.key});

  @override
  State<edite_Screen> createState() => _edite_ScreenState();
}

class _edite_ScreenState extends State<edite_Screen> {
  @override
  Widget build(BuildContext context) {

    final TextStyle? large = TextFormate(colors: Colors.white).textLargeFormate(context);
    final TextStyle? medium = TextFormate(colors: Colors.white).textMediumFormate(context);
    final TextStyle? small = TextFormate(colors: Colors.white).textSmallFormate(context);

    return Scaffold(
      backgroundColor: AppColor.bodycolor,
      appBar: AppBar(
        backgroundColor: AppColor.appbarcolor,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_rounded,color: AppColor.whiteall,)),
        title: Text('Edite',style: large ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Form(
              child: Padding(
                padding: EdgeInsets.all(0.0),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Title",style: large,),
                        ),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.whiteall),
                                borderRadius: BorderRadius.circular(40.r),
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                              labelText: "Enter Title",
                              labelStyle: TextStyle(
                                  color: Colors.white
                              ),
                            ), // Label for the name field
                          ),
                        ),

                        SizedBox(height: 40.h,),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Description",style: context.textTheme.titleLarge?.copyWith(color: Colors.white)),
                        ),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.whiteall),
                                borderRadius: BorderRadius.circular(40.r),
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                              labelText: "Enter Description",
                              labelStyle: TextStyle(
                                  color: Colors.white
                              ),
                            ), // Label for the name field
                          ),
                        ),

                        SizedBox(height: 20.0.h),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.whiteall,
                                shadowColor: Colors.greenAccent,
                                elevation: 3,
                                fixedSize: Size(306.w, 48.h), // specify width, height
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r,))),
                            onPressed: () {},
                            child: Text('Update',style: context.textTheme.titleLarge?.copyWith(color: Colors.blue)), // Text on the button
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
