import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:test_app/main.dart';


import 'ExpenditureRequest.dart';
import 'InspectionReports.dart';
import 'ReleaseRequest.dart';
import 'RequestStatus.dart';
import 'bar_chart_sample1.dart';
import 'bar_chart_sample2.dart';
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

      home: const Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  State<Dashboard> createState() => Dashboard1();
}

class Dashboard1 extends State<Dashboard> {
  // TextEditingController nameController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  //final formKey = GlobalKey<FormState>();
  // bool showpassword=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
        iconTheme: IconThemeData(
        color: Colors.black,),
          title: const Text('Dashboard',style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          actions: [
            Container(
              width: 30,
              child: SvgPicture.asset('assets/icons/ic_logo_right.svg'),
            ),

          ],
        ),
        drawer: Drawer(

          child: ListView(
            // Important: Remove any padding from the ListView.

            children: [
               DrawerHeader(
                 decoration: BoxDecoration(color: Colors.white,),
                   child: Stack(
                 children: [

                   Align(
                     alignment: Alignment.topLeft,
                     child: SvgPicture.asset('assets/icons/ic_close.svg',height: 15,) ,),

                   Align(
                     alignment: Alignment.topRight,
                     child: SvgPicture.asset('assets/icons/ic_logo.svg',height: 35,) ,)
                 ],
               )
               ),
              ListTile(
                leading: SvgPicture.asset('assets/icons/ic_dashboard.svg'),
                title: const Text('Dashboard'),
                onTap: () {
                  Navigator.of (context).push(MaterialPageRoute(builder: (context)=>Dashboard()),);
                },
              ),
              ListTile(
                leading: SvgPicture.asset('assets/icons/ic_inspection_reports.svg'),
                title: const Text('Inspection Reports'),
                onTap: () {
                  Navigator.of (context).push(MaterialPageRoute(builder: (context)=>InspectionReport()),);
                  // Navigator.pop(context);
                },
              ),
              ListTile(
                leading: SvgPicture.asset('assets/icons/ic_releaseReq.svg'),
                title: const Text('Release Requests'),
                onTap: () {
                  Navigator.of (context).push(MaterialPageRoute(builder: (context)=>Release()),);
                },
              ),
              ListTile(
                leading: SvgPicture.asset('assets/icons/ic_expenditure.svg'),
                title: const Text('Expenditure Requests'),
                onTap: () {
                  Navigator.of (context).push(MaterialPageRoute(builder: (context)=>Expenditure()),);
                },
              ),
              ListTile(
                leading: SvgPicture.asset('assets/icons/ic_requestStatus.svg'),
                title: const Text('Request Status'),
                onTap: () {
                  Navigator.of (context).push(MaterialPageRoute(builder: (context)=>Request()),);
                },
              ),
              SizedBox(height: 200,),
              ListTile(
                leading: SvgPicture.asset('assets/icons/ic_logout.svg',),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.of (context).push(MaterialPageRoute(builder: (context)=>SplashScreen(title: '',),),);
                },
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
            child: SingleChildScrollView(
          child: Column(
              //mainAxisAlignment:MainAxisAlignment.center ,
              children:[

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: BarChartSample1(),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: BarChartSample2(),
                ),
              ]
          ),))



    );

  }
}
