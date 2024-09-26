import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poly_notepad_app/constant/colors.dart';
import 'package:poly_notepad_app/constant/image.dart';
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

  Future<void> readItemsDatabase()async{

    setState(() {
      items = [];
    });

    final allnotes = await DbHelper().readItems();
    print(allnotes);
    setState(() {
      items.addAll(allnotes);
    });
  }

   String? direction = 'listview';

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
      Colors.teal,           // টিল
      Colors.indigo,         // গাঢ় নীল
      Colors.amber,          // অ্যাম্বার
      Colors.cyan,           // আকাশী
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
          IconButton(
            onPressed: () {
              setState(() {
                direction = direction == "listview" ? "gridview" : "listview";
              });
            },
            icon: Icon(direction == "listview" ? Icons.list : Icons.grid_view),
          ),
          IconButton(onPressed: (){Get.to<Profile_Screen>(Profile_Screen());},
              icon: Container(
                width: 35, // ছবির প্রস্থ
                height: 35, // ছবির উচ্চতা
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.0), // বর্ডার কালার এবং পুরুত্ব
                ),
                child: ClipOval( // ছবি ক্লিপ করার জন্য
                  child: ImagesClass.imagecoustom,
                ),
              ),
                //iconSize: 10,
          ),
    ],
        ),
      drawer: const Drawer_Screen(),
      body: RefreshIndicator(
        onRefresh: ()=> readItemsDatabase(),

        child: SingleChildScrollView(
          child: Column(
            children: [
              const Search_Your_Notes(),
              direction == 'gridview'?
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // প্রতিটি সারিতে কয়টি আইটেম থাকবে
                    crossAxisSpacing: 10.0, // গ্রিডের কলামের মধ্যে দূরত্ব
                    mainAxisSpacing: 10.0, // সারির মধ্যে দূরত্ব
                  ),
                  physics: NeverScrollableScrollPhysics(), // স্ক্রলিং বন্ধ করে দেওয়া হয়েছে
                  shrinkWrap: true, // গ্রিডের উচ্চতা এর কনটেন্ট অনুযায়ী অটো অ্যাডজাস্ট হবে
                  itemCount: items.length, // গ্রিডের মোট আইটেম সংখ্যা
                  itemBuilder: (context, index) {

                    final Color backgroundColor = colors[index % colors.length];

                    String titletext = items[index]['title']!;
                    String firstLetter = titletext[0]; // প্রথম অক্ষর

                    return InkWell(
                      onTap: (){
                        Get.to<Note_Details>(
                                ()=> Note_Details(title: items[index]['title'],description: items[index]['description'],id: items[index]['id'],date: items[index]['date'],backgroundcolor: colors[index % colors.length],));
                        print(items[index]['title'],);
                        print(items[index]['description']);
                      },

                      child: Container(
                        decoration: BoxDecoration(
                          color: backgroundColor, // বিভিন্ন রঙের ব্যাকগ্রাউন্ড
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 4.0), // বর্ডার কালার এবং পুরুত্ব
                                    ),
                                    child: CircleAvatar(
                                        backgroundColor: Colors.blue,
                                        child: Center(child: Text('${firstLetter}',maxLines: 1,style: context.textTheme.titleMedium?.copyWith(color: Colors.white)))),
                                  ),
                                  Spacer(),
                                  IconButton( onPressed: () {
                                    DbHelper().deleteItems(items[index]['id'], context);
                                    readItemsDatabase();
                                  }, icon: Icon(Icons.delete, color: Colors.red,),),
                                ],
                              ),
                              SizedBox(height: 10.h,),
                              Text('${items[index]['title']}',style: context.textTheme.titleLarge?.copyWith(color: Colors.black, ),maxLines: 2, overflow: TextOverflow.ellipsis),

                              Text('${items[index]['description']}',style: mediumblack,maxLines: 2, overflow: TextOverflow.ellipsis),

                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
                  :
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
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
                        Get.to<Note_Details>(
                          ()=> Note_Details(title: items[index]['title'],description: items[index]['description'],id: items[index]['id'],date: items[index]['date'],backgroundcolor: colors[index % colors.length],));
                        print(items[index]['title'],);
                        print(items[index]['description']);
                      },
                      child: ListTile(
                        title: Text('${items[index]['title']}',style: context.textTheme.titleLarge?.copyWith(color: Colors.black, ),maxLines: 1, overflow: TextOverflow.ellipsis),
                        subtitle: Text('${items[index]['description']}',style: mediumblack,maxLines: 1, overflow: TextOverflow.ellipsis),
                        trailing: IconButton( onPressed: () {
                          DbHelper().deleteItems(items[index]['id'], context);
                          readItemsDatabase();
                          }, icon: Icon(Icons.delete, color: Colors.red,),),
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
            ],
          ),
        ),
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
