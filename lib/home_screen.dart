import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'constant/text.dart';




class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  //static TextStyle? textStyle = context.textTheme.titleLarge?.copyWith();

  List item = [1,2,3,4,5];

  @override
  Widget build(BuildContext context) {

    final TextStyle? largeblack = TextFormate(colors: Colors.black).textLargeFormate(context);
    final TextStyle? mediumblack = TextFormate(colors: Colors.black).textMediumFormate(context);
    final TextStyle? smallblack = TextFormate(colors: Colors.black).textSmallFormate(context);


    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.blue,
        title: Text("Note Pad",style: context.textTheme.titleLarge?.copyWith(color: Colors.white),),
        centerTitle: true,
        ),
      body: ListView.builder(
        itemCount: item.length,
        itemBuilder: ( context,  index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 5,
            child: ListTile(
              title: Text('Title',style: context.textTheme.titleLarge?.copyWith(color: Colors.black, )),
              subtitle: Text('Discription',style: mediumblack,),
              trailing: Icon(Icons.edit),
              leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('T',style: context.textTheme.titleMedium?.copyWith(color: Colors.white))),
            ),
          ),
        );
      },
      ),
    );
  }
}
