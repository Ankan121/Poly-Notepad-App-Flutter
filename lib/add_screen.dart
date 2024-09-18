import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poly_notepad_app/constant/text.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // A key for managing the form
  String _fast_name = ''; // Variable to store the entered name
  String _last_name = '';
  String _email = ''; // Variable to store the entered email
  String _passwored = '';
  String _re_password = '';

  void _submitForm() {
    // Check if the form is valid
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      //Get.to(ApplyScreen());
      print('Name: $_fast_name'); // Print the name
      print('Mobile Number: $_last_name'); // Print the email
      print("Email ID/Phone Number: $_email" );
      print("Password: $_passwored");
      print("Re-enter Password: $_re_password");
    }
  }


  @override
  Widget build(BuildContext context) {

    final TextStyle? large = TextFormate(colors: Colors.white).textLargeFormate(context);
    final TextStyle? medium = TextFormate(colors: Colors.white).textMediumFormate(context);
    final TextStyle? small = TextFormate(colors: Colors.white).textSmallFormate(context);

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Add',style: large ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Form(
              key: _formKey, // Associate the form key with this Form widget
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
                                borderSide: BorderSide(color: Colors.white),
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Fast Name.'; // Return an error message if the name is empty
                              }
                              return null; // Return null if the name is valid
                            },
                            onSaved: (value) {
                              _fast_name = value!; // Save the entered name
                            },
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
                                borderSide: BorderSide(color: Colors.white),
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Fast Name.'; // Return an error message if the name is empty
                              }
                              return null; // Return null if the name is valid
                            },
                            onSaved: (value) {
                              _fast_name = value!; // Save the entered name
                            },
                          ),
                        ),

                        SizedBox(height: 20.0.h),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shadowColor: Colors.greenAccent,
                                elevation: 3,
                                fixedSize: Size(306.w, 48.h), // specify width, height
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r,))),
                            onPressed: _submitForm, // Call the _submitForm function when the button is pressed
                            child: Text('Save',style: context.textTheme.titleLarge?.copyWith(color: Colors.blue)), // Text on the button
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
