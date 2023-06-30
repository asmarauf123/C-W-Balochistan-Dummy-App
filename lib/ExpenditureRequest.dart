import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:intl/intl.dart';


import 'RequestStatus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const Expenditure(),
    );
  }
}

class Expenditure extends StatefulWidget {
  const Expenditure({Key? key}) : super(key: key);
  @override
  State<Expenditure> createState() => Expenditure1();
}

class Expenditure1 extends State<Expenditure> {

  TextEditingController calanderController1 = TextEditingController();
  TextEditingController releaseController1 = TextEditingController();
  TextEditingController remarksController1 = TextEditingController();
  TextEditingController pictureController1 = TextEditingController();
  String? selectedValue = null;
  String? selectedValue1 = null;
  final formKey3 = GlobalKey<FormState>();
  // bool showpassword=false;
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,),
        title: const Text('Release Request',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
         leading: IconButton(
           icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context, false),),
        actions: [
          Container(
            width: 30,
            child: SvgPicture.asset('assets/icons/ic_logo_right.svg'),
          ),
        ],
      ),
      //drawer: Drawer(

        // child: ListView(
        //   // Important: Remove any padding from the ListView.
        //
        //   children: [
        //     DrawerHeader(
        //         decoration: BoxDecoration(color: Colors.white,),
        //         child: Stack(
        //           children: [
        //
        //             Align(
        //               alignment: Alignment.topLeft,
        //               child: SvgPicture.asset('assets/icons/ic_close.svg',height: 15,) ,),
        //
        //             Align(
        //               alignment: Alignment.topRight,
        //               child: SvgPicture.asset('assets/icons/ic_logo.svg',height: 35,) ,)
        //           ],
        //         )
        //     ),
        //     ListTile(
        //       leading: SvgPicture.asset('assets/icons/ic_dashboard.svg'),
        //       title: const Text('Dashboard'),
        //       onTap: () {
        //         Navigator.of (context).push(MaterialPageRoute(builder: (context)=>Dashboard()),);
        //       },
        //     ),
        //     ListTile(
        //       leading: SvgPicture.asset('assets/icons/ic_inspection_reports.svg'),
        //       title: const Text('Inspection Reports'),
        //       onTap: () {
        //         Navigator.of (context).push(MaterialPageRoute(builder: (context)=>InspectionReport()),);
        //       },
        //     ),
        //     ListTile(
        //       leading: SvgPicture.asset('assets/icons/ic_releaseReq.svg'),
        //       title: const Text('Release Requests'),
        //       onTap: () {
        //         Navigator.of (context).push(MaterialPageRoute(builder: (context)=>Release()),);
        //       },
        //     ),
        //     ListTile(
        //       leading: SvgPicture.asset('assets/icons/ic_expenditure.svg'),
        //       title: const Text('Expenditure Requests'),
        //       onTap: () {
        //         Navigator.of (context).push(MaterialPageRoute(builder: (context)=>Expenditure()),);
        //       },
        //     ),
        //     ListTile(
        //       leading: SvgPicture.asset('assets/icons/ic_requestStatus.svg'),
        //       title: const Text('Request Status'),
        //       onTap: () {
        //         Navigator.of (context).push(MaterialPageRoute(builder: (context)=>Request()),);
        //       },
        //     ),
        //     SizedBox(height: 200,),
        //     ListTile(
        //       leading: SvgPicture.asset('assets/icons/ic_logout.svg',),
        //       title: const Text('Logout'),
        //       onTap: () {
        //         Navigator.of (context).push(MaterialPageRoute(builder: (context)=>SplashScreen(title: '',),),);
        //       },
        //     ),
        //   ],
        // ),
      //),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // decoration: BoxDecoration(border: Border.all(color: Colors.green),borderRadius: BorderRadius.circular(20.0),),
                child: Form(
                  key: formKey3,
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    children: [
                      SizedBox(height: 10.0),
                      Text('Sector'),
                      SizedBox(height: 10.0),
                      DropdownButtonFormField(

                        decoration: InputDecoration(
                          hintText: 'Select Sector',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38,),
                            borderRadius: BorderRadius.circular(40),

                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38 ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) => value == null ? "Select sector" : null,
                        dropdownColor: Colors.white,
                        value: selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        //itemHeight: 10,
                        items: dropdownItems,
                      ),
                      SizedBox(height: 20,),

                      Text('Project/Scheme',),
                      SizedBox(height: 5.0),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          hintText: 'Select',

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38,),
                            borderRadius: BorderRadius.circular(40),

                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38 ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) => value == null ? "Select project" : null,
                        dropdownColor: Colors.white,
                        value: selectedValue1,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue1 = newValue!;
                          });
                        },
                        //itemHeight: 10,
                        items: dropdownItems1,
                      ),
                      SizedBox(height: 20,),

                      Text('Remarks',),
                      SizedBox(height: 5.0),
                      TextFormField(
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: 7,
                        controller: remarksController1,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,),
                        decoration:  InputDecoration(
                          hintText: 'Enter Remarks',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38,),
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },

                      ),
                      SizedBox(height: 20,),

                      Text('Release Date',),
                      SizedBox(height: 5.0),
                      TextFormField(
                        controller: calanderController1,
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                        ),
                        decoration:InputDecoration(
                          // suffixIcon:new Padding(
                          //   padding: const EdgeInsets.only( top: 15, left: 5, right: 0, bottom: 15),
                          //   child: new SizedBox(
                          //     height: 20,
                          //     child: SvgPicture.asset('assets/icons/ic_calander.svg',color: Colors.black,),
                          //   ),
                          // ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          hintText: 'yyyy/mm/dd',
                          contentPadding: EdgeInsets.fromLTRB(40.0, 10.0, 20.0, 10.0),
                          icon: SvgPicture.asset('assets/icons/ic_calander.svg',color: Colors.black,),
                        ),

                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            setState(() {
                              calanderController1.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {}
                        },
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },

                      ),
                      SizedBox(height: 20,),
                      Text('Amount',),
                      SizedBox(height: 5.0),
                      TextFormField(
                        controller: releaseController1,
                        style:TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)
                          ),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),),
                        // obscureText: !showpassword,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                          {return 'Please Enter Some Text';}
                          return null;},
                      ),
                      SizedBox(height: 20,),

                      Container(
                        alignment: Alignment.center,
                        child:ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(200, 50),
                              maximumSize: const Size(200, 50),
                              primary: Colors.green,
                              shape: StadiumBorder(),
                            ),
                            child: Text('Submit',style: TextStyle(color: Colors.white),),
                            onPressed: (){
                               if (formKey3.currentState!.validate()) {
                                 //   Navigator.of (context).push(MaterialPageRoute(builder: (context)=> Dashboard()));
                                 //   // If the form is valid, display a snackbar. In the real world,
                                 //   ScaffoldMessenger.of(context).showSnackBar(
                                 //     const SnackBar(content: Text('Credentials are Right')),
                                 Navigator.of (context).push(MaterialPageRoute(builder: (context)=>Request()),);
                               }
                            }

                        ),),
                      SizedBox(height: 30,),

                    ],
                  ),

                ),
              )
            ],),
        ),

      ),

    );

  }
  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("SECTOR A",style: TextStyle(color: Colors.black),),value: "Sectors A"),
      DropdownMenuItem(child: Text("SECTOR B",style: TextStyle(color: Colors.black),),value: "Sectors B"),
      DropdownMenuItem(child: Text("SECTOR C",style: TextStyle(color: Colors.black),),value: "SECTOR C"),
      DropdownMenuItem(child: Text("SECTOR D",style: TextStyle(color: Colors.black),),value: "SECTOR D"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItems1{
    List<DropdownMenuItem<String>> menuItems1 = [
      DropdownMenuItem(child: Text("PROJECT A",style: TextStyle(color: Colors.black),),value: "PROJECT A"),
      DropdownMenuItem(child: Text("PROJECT B",style: TextStyle(color: Colors.black),),value: "PROJECT B"),
      DropdownMenuItem(child: Text("PROJECT C",style: TextStyle(color: Colors.black),),value: "PROJECT C"),
      DropdownMenuItem(child: Text("PROJECT D",style: TextStyle(color: Colors.black),),value: "PROJECT D"),
    ];
    return menuItems1;
  }
}


