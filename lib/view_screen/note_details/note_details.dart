import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poly_notepad_app/constant/colors.dart';
import 'package:get/get.dart';
import 'package:poly_notepad_app/view_screen/home_screen/home_screen.dart';

import '../../constant/text.dart';
import '../../db_service/db_herper.dart';

class Note_Details extends StatefulWidget {
   Note_Details({super.key, this.title, this.description, this.backgroundcolor, this.id, this.date});
   final int? id;
   final  date;
   final String? title;
   final String? description;
   final Color? backgroundcolor;



  @override
  State<Note_Details> createState() => _Note_DetailsState();
}

class _Note_DetailsState extends State<Note_Details> {

  final titleEditingController = TextEditingController();
  final descriptionEditingController = TextEditingController();

  @override
  void initState() {
    setData();
    super.initState();
  }

  void setData(){
    setState(() {
      titleEditingController.text = widget.title.toString() ;
      descriptionEditingController.text = widget.description.toString();
    });
  }

  @override
  Widget build(BuildContext context) {


    final TextStyle? largewhite = TextFormate(colors: Colors.white).textLargeFormate(context);
    final TextStyle? mediumwhite = TextFormate(colors: Colors.white).textMediumFormate(context);
    final TextStyle? smallwhite = TextFormate(colors: Colors.white).textSmallFormate(context);

    final TextStyle? largeblack = TextFormate(colors: Colors.black).textLargeFormate(context);
    final TextStyle? mediumblack = TextFormate(colors: Colors.black).textMediumFormate(context);
    final TextStyle? smallblack = TextFormate(colors: Colors.black).textSmallFormate(context);


    return Scaffold(
        //String? formattedDate = DateFormat('dd-MM-yyyy').format(widget.date);
      backgroundColor: AppColor.bodycolor,
      appBar: AppBar(
        leading: IconButton(onPressed: ()async{
          print('sucess');
          print(widget.id);
          if(titleEditingController.text.isEmpty || descriptionEditingController.text.isEmpty){
            var snackBar = SnackBar(content: Text('All field are required !'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }else{
            await DbHelper().noteupdate(widget.id,
                {
                  'title': titleEditingController.text,
                  'description': descriptionEditingController.text,
                },context);
          }
          Get.back();

          //Get.back();
          }, icon: Icon(Icons.arrow_back_rounded,color: Colors.white,)),
        backgroundColor: AppColor.appbarcolor,
        title: Text('Note Details',style: largewhite,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text('Date:- ${widget.date}',style: largewhite,)),
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
                    TextFormField(
                      minLines: 1,
                      maxLines: null,
                      controller: titleEditingController,
                      onSaved: (String? value) {

                      },

                    ),
                    //Text('${widget.title}',style: largeblack,),
                    SizedBox(height: 10,),
                    Text('Description',style: context.textTheme.titleLarge?.copyWith(color: Colors.black,decoration: TextDecoration.underline ),),
                    TextFormField(
                      minLines: 1,
                      maxLines: null,
                      controller: descriptionEditingController,
                      onSaved: (String? value){

                      },
                    ),
                    //Text('${widget.description}',style: mediumblack,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
