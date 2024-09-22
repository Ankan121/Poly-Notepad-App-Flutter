import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poly_notepad_app/constant/colors.dart';
import 'package:poly_notepad_app/db_service/db_herper.dart';
import '../constant/text.dart';
import 'edite_screen.dart';




class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  List items = [];

  void initState(){
    readItemsDatabase();
    super.initState();
  }

  void readItemsDatabase()async{
    final allnotes = await DbHelper().readItems();
    print(allnotes);
    setState(() {
      items.addAll(allnotes);
    });
  }

  @override
  Widget build(BuildContext context) {

    final TextStyle? largeblack = TextFormate(colors: Colors.black).textLargeFormate(context);
    final TextStyle? mediumblack = TextFormate(colors: Colors.black).textMediumFormate(context);
    final TextStyle? smallblack = TextFormate(colors: Colors.black).textSmallFormate(context);


    return Scaffold(
      backgroundColor: AppColor.bodycolor,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: AppColor.appbarcolor,
        title: Text("Note Pad",style: context.textTheme.titleLarge?.copyWith(color: Colors.white),),
        centerTitle: true,
        ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: ( context,  index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 5,
            child: ListTile(
              title: Text('${items[index]['title']}',style: context.textTheme.titleLarge?.copyWith(color: Colors.black, )),
              subtitle: Text('${items[index]['description']}',style: mediumblack,),
              trailing: IconButton( onPressed: () {
                Get.to<edite_Screen>(edite_Screen());
              }, icon: Icon(Icons.edit),),
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
