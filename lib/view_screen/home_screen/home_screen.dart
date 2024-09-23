import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poly_notepad_app/constant/colors.dart';
import 'package:poly_notepad_app/db_service/db_herper.dart';
import 'package:poly_notepad_app/view_screen/Add_Note_Screen/add_screen.dart';
import 'package:poly_notepad_app/view_screen/home_screen/drawer.dart';
import 'package:poly_notepad_app/view_screen/home_screen/search_your-note.dart';
import 'package:poly_notepad_app/view_screen/note_details/note_details.dart';
import 'package:poly_notepad_app/view_screen/profile_screen/profile_Screen.dart';
import '../../constant/text.dart';
import '../note_edite_screen/edite_screen.dart';





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

    final TextStyle? largewhite = TextFormate(colors: Colors.white).textLargeFormate(context);
    final TextStyle? mediumwhite = TextFormate(colors: Colors.white).textMediumFormate(context);
    final TextStyle? smallwhite = TextFormate(colors: Colors.white).textSmallFormate(context);

    final List<Color> colors = [
      Colors.red.withOpacity(0.5),            // লাল
      Colors.green,          // সবুজ
      Colors.orange,         // কমলা
      Colors.purple,         // বেগুনি
      Colors.teal,           // টিল
      Colors.indigo,         // গাঢ় নীল
      Colors.amber,          // অ্যাম্বার
      Colors.cyan,           // আকাশী
      Colors.pink,           // গোলাপি
      Colors.lime,           // হালকা সবুজ
      Colors.deepOrange,     // গাঢ় কমলা
      Colors.lightGreen,     // হালকা সবুজ
      Colors.lightBlue,      // হালকা নীল
      Colors.deepPurple,     // গাঢ় বেগুনি
      Colors.brown,          // বাদামী
      Colors.yellowAccent,   // হলুদ এক্সেন্ট
      Colors.blueGrey,       // ধূসর-নীল
    ];





    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: AppColor.bodycolor.withOpacity(0.8),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 5,
        backgroundColor: AppColor.appbarcolor,
        title: Text("Note Pad",style: context.textTheme.titleLarge?.copyWith(color: Colors.white),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){Get.to<Profile_Screen>(Profile_Screen());},
              icon: Container(
                width: 35, // ছবির প্রস্থ
                height: 35, // ছবির উচ্চতা
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.0), // বর্ডার কালার এবং পুরুত্ব
                ),
                child: ClipOval( // ছবি ক্লিপ করার জন্য
                  child: Image.network(
                    'https://scontent.fdac110-1.fna.fbcdn.net/v/t39.30808-1/421750988_913338270136654_635347076248654908_n.jpg?stp=dst-jpg_s200x200&_nc_cat=111&ccb=1-7&_nc_sid=50d2ac&_nc_ohc=lT0F270Zj6sQ7kNvgGrOmpn&_nc_ht=scontent.fdac110-1.fna&_nc_gid=AFadN_OLp_7XT6xCbiSfBjh&oh=00_AYB3F25DP5PmWCOBX8eylMQTEh_g-qz3OFNWdVjuWte0DQ&oe=66F217E6',
                    width: 35, // ছবির প্রস্থ
                    height: 35, // ছবির উচ্চতা
                    fit: BoxFit.cover, // ছবি কভার ফিটিং
                  ),
                ),
              ),
                //iconSize: 10,
          ),
        ],
        ),
      drawer: const Drawer_Screen(),
      body: Column(
        children: [
          const Search_Your_Notes(),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: ( context,  index) {

                final Color backgroundColor = colors[index % colors.length];

                String titletext = items[index]['title']!;
                String firstLetter = titletext[0]; // প্রথম অক্ষর

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: backgroundColor,
                  elevation: 5,
                  child: InkWell(
                    onTap: (){
                      Get.to<Note_Details>(Note_Details(title: items[index]['title'],description: items[index]['description'],backgroundcolor: colors[index % colors.length],));
                      print(items[index]['title'],);
                      print(items[index]['description']);
                    },
                    child: ListTile(
                      title: Text('${items[index]['title']}',style: context.textTheme.titleLarge?.copyWith(color: Colors.black, ),maxLines: 1, overflow: TextOverflow.ellipsis),
                      subtitle: Text('${items[index]['description']}',style: mediumblack,maxLines: 1, overflow: TextOverflow.ellipsis),
                      trailing: IconButton( onPressed: () {
                        Get.to<edite_Screen>(edite_Screen());
                        }, icon: Icon(Icons.edit),),
                      leading: Container(
                        padding: EdgeInsets.all(4.0), // বর্ডারের পুরুত্বের জন্য মার্জিন
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4.0), // বর্ডার কালার এবং পুরুত্ব
                        ),
                        child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Center(child: Text('${firstLetter}',maxLines: 1,style: context.textTheme.titleMedium?.copyWith(color: Colors.white)))),
                      ),
                    ),
                  ),
                ),
              );
            },
            ),
          ),
        ],
      ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.white.withOpacity(0.9),
          onPressed: (){
            Get.to<Add_Screen>(Add_Screen());
          },
          label:  Text('Add',style: mediumblack,),
          icon: Icon(Icons.add, color: Colors.black, size: 25),
        )
    );
  }
}
