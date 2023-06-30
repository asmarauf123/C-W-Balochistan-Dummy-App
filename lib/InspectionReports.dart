
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'ReleaseRequest.dart';

import 'package:geolocator/geolocator.dart';

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

      home: const InspectionReport(),
    );
  }
}

class InspectionReport extends StatefulWidget {
  const InspectionReport({Key? key}) : super(key: key);
  @override
  State<InspectionReport> createState() => InspectionReport1();


}

class InspectionReport1 extends State<InspectionReport> {

  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  late StreamSubscription<Position> positionStream;

  File? image1;
  Future pickedimage(ImageSource source)  async{
    final image1 = await ImagePicker().pickImage(source: source );
    if (image1 == null) return;
    final imageTemporary= File (image1.path);
    setState(() => this.image1= imageTemporary);
  }


   TextEditingController sectorController = TextEditingController();
  TextEditingController projectController = TextEditingController();
   TextEditingController inspectionController = TextEditingController();
   TextEditingController gpsController = TextEditingController();
   TextEditingController pictureController = TextEditingController();

   String? selectedValue = null;
   String? selectedValue1 = null;
  final formKey2 = GlobalKey<FormState>();
  // bool showpassword=false;
   @override
   void initState() {
     checkGps();
     super.initState();
   }
  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if(servicestatus){
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        }else if(permission == LocationPermission.deniedForever){
          print("'Location permissions are permanently denied");
        }else{
          haspermission = true;
        }
      }else{
        haspermission = true;
      }

      if(haspermission){
        setState(() {
          //refresh the UI
        });

        getLocation();
      }
    }else{
      print("GPS Service is not enabled, turn on GPS location");
    }

    setState(() {
      //refresh the UI
    });
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457

    long = position.longitude.toString();
    lat = position.latitude.toString();
    setState(() {
      gpsController.text= long.toString() + lat.toString();

    });

    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
        locationSettings: locationSettings).listen((Position position) {
      print(position.longitude); //Output: 80.24599079
      print(position.latitude); //Output: 29.6593457

      long = position.longitude.toString();
      lat = position.latitude.toString();

      setState(() {
        //refresh UI on update
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,),
        title: const Text('Inspection Reports',style: TextStyle(color: Colors.black),),
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
      // drawer: Drawer(
      //
      //   child: ListView(
      //     // Important: Remove any padding from the ListView.
      //
      //     children: [
      //       DrawerHeader(
      //           decoration: BoxDecoration(color: Colors.white,),
      //           child: Stack(
      //             children: [
      //
      //               Align(
      //                 alignment: Alignment.topLeft,
      //                 child: SvgPicture.asset('assets/icons/ic_close.svg',height: 15,) ,),
      //
      //               Align(
      //                 alignment: Alignment.topRight,
      //                 child: SvgPicture.asset('assets/icons/ic_logo.svg',height: 35,) ,)
      //             ],
      //           )
      //       ),
      //       ListTile(
      //         leading: SvgPicture.asset('assets/icons/ic_dashboard.svg'),
      //         title: const Text('Dashboard'),
      //         onTap: () {
      //           Navigator.of (context).push(MaterialPageRoute(builder: (context)=>Dashboard()),);
      //         },
      //       ),
      //       ListTile(
      //         leading: SvgPicture.asset('assets/icons/ic_inspection_reports.svg'),
      //         title: const Text('Inspection Reports'),
      //         onTap: () {
      //           Navigator.of (context).push(MaterialPageRoute(builder: (context)=>InspectionReport()),);
      //         },
      //       ),
      //       ListTile(
      //         leading: SvgPicture.asset('assets/icons/ic_releaseReq.svg'),
      //         title: const Text('Release Requests'),
      //         onTap: () {
      //           Navigator.of (context).push(MaterialPageRoute(builder: (context)=>Release()),);
      //         },
      //       ),
      //       ListTile(
      //         leading: SvgPicture.asset('assets/icons/ic_expenditure.svg'),
      //         title: const Text('Expenditure Requests'),
      //         onTap: () {
      //           Navigator.of (context).push(MaterialPageRoute(builder: (context)=>Expenditure()),);
      //         },
      //       ),
      //       ListTile(
      //         leading: SvgPicture.asset('assets/icons/ic_requestStatus.svg'),
      //         title: const Text('Request Status'),
      //         onTap: () {
      //           Navigator.of (context).push(MaterialPageRoute(builder: (context)=>Request()),);
      //         },
      //       ),
      //       SizedBox(height: 200,),
      //       ListTile(
      //         leading: SvgPicture.asset('assets/icons/ic_logout.svg',),
      //         title: const Text('Logout'),
      //         onTap: () {
      //           Navigator.of (context).push(MaterialPageRoute(builder: (context)=>SplashScreen(title: '',),),);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: Padding(

        padding: const EdgeInsets.all(10),

        child: SingleChildScrollView(

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(

                // decoration: BoxDecoration(border: Border.all(color: Colors.green),borderRadius: BorderRadius.circular(20.0),),
                child: Form(
                  key: formKey2,
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

                      Text('Inspection Report',),
                      SizedBox(height: 5.0),
                     TextFormField(
                          controller: inspectionController,
                          style:TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,),
                          decoration: InputDecoration(hintText: 'Enter Details',
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
                      Text('GPS Coordinates(latitude, longitude)',),
                      SizedBox(height: 5.0),
                      GestureDetector(
                        child: TextFormField(
                          controller: gpsController,
                          style:TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,),
                          decoration: InputDecoration(hintText: 'Enter Coordinates',
                            hintStyle: TextStyle(fontSize: 15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0)
                            ),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),),
                          // obscureText: !showpassword,
                        ),
                        onTap: checkGps,
                      ),

                      SizedBox(height: 20,),

                      Text('Pictures',),
                      SizedBox(height: 5.0),
                      TextFormField(
                        controller: pictureController,
                        style:TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,),
                        decoration: InputDecoration(
                          hintText: 'Select Images',
                          hintStyle: TextStyle(fontSize: 15),
                          suffixIcon: new Padding(
                            padding: const EdgeInsets.only( top: 15, left: 5, right: 0, bottom: 15),
                            child: new SizedBox(
                              height: 20,
                              child: SvgPicture.asset('assets/icons/ic_camera.svg',),
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                          contentPadding: EdgeInsets.fromLTRB(40.0, 10.0, 20.0, 10.0),),
                        // obscureText: !showpassword,
                        onTap: ()
                        {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
                              backgroundColor: Colors.white,
                              context: context,
                              builder: (context)=>Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:18,vertical: 60, ),
                              child: Column (
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    child:Text('Camera',style: TextStyle(color: Colors.red),textAlign: TextAlign.right,),
                                    onTap: ()
                                      {pickedimage(ImageSource.camera);
                                      // FutureBuilder (
                                      // future: pickedFile,
                                      // builder: (context, data)
                                      // {
                                      // if (data.hasData) {
                                      // return Container(height: 200.0,child: Image.file(data.data as File,fit: BoxFit.contain,height: 200.0,),);
                                      // }
                                      //color: Colors.blue,
                                      },
                                  ),
                        //},

                                  SizedBox(height: 20.0),
                                  GestureDetector(
                                    child:Text('Gallary',style: TextStyle(color: Colors.red),textAlign: TextAlign.right,),
                                    onTap: ()
                                    {pickedimage(ImageSource.gallery);},
                                  ),
                                ],

                              ))
                          );
                          //_openCamera(context);
                          //_openGallery(context);
                        },
                      ),
                      SizedBox(height: 20,),
                     Spacer(),
                      image1 != null ?  Image.file(image1!,width: 140,height: 140,fit: BoxFit.cover,) :FlutterLogo(size: 140,),
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
                            onPressed: () {
                              if (formKey2.currentState!.validate()) {
                                //   Navigator.of (context).push(MaterialPageRoute(builder: (context)=> Dashboard()));
                                //   // If the form is valid, display a snackbar. In the real world,
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //     const SnackBar(content: Text('Credentials are Right')),
                                //
                                // );
                                Navigator.of (context).push(MaterialPageRoute(builder: (context)=>Release()),);
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

  // void openGallery(ImageSource context) async{
  //   final pickedFile = await ImagePicker().pickImage(source:source );
  //   setState(() =>
  //     //imageFile = pickedFile! as PickedFile?;
  //   );
  //
  // }

}
