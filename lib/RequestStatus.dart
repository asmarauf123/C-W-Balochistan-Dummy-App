import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Request Status',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const Request(),
    );
  }
}

class Request extends StatefulWidget {
  const Request({Key? key}) : super(key: key);
  @override
  State<Request> createState() => Request1();
}

class Request1 extends State<Request> {
  // final ScrollController controller = ScrollController();
  // final double height = 100.0;
  // final formKey3 = GlobalKey<FormState>();
  // bool showpassword=false;
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,),
        title: const Text('Request Status',style: TextStyle(color: Colors.black),),
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
       // child:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
             child:Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 ElevatedButton(
                   child: Text('Release Request'),
                   style: ElevatedButton.styleFrom(
                     minimumSize: const Size(200, 50),
                     maximumSize: const Size(200, 50),
                     primary: Colors.green,
                     shape: StadiumBorder(),
                   ),
                   // style: ButtonStyle(
                   //
                   //   overlayColor: MaterialStateProperty.resolveWith<Color?>(
                   //         (Set<MaterialState> states) {
                   //       if (states.contains(MaterialState.pressed))
                   //         return Colors.redAccent; //<-- SEE HERE
                   //       return null; // Defer to the widget's default.
                   //     },
                   //   ),
                   // ),
                     onPressed: () {},
                     ),
                 SizedBox(width: 20,),
                 ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     minimumSize: const Size(200, 50),
                     maximumSize: const Size(200, 50),
                     primary: Colors.green,
                     shape: StadiumBorder(),
                   ),
                   child: Text('Expenditure Request'),
                     onPressed: ()
                   {},
                    )
               ],),
    ),
            Expanded(
              child: ListView(
                children: [
                  Card(
                      child: ListTile(title:Text("List Item 1"),subtitle: Text("21-07-2020"),
                        trailing: ElevatedButton(onPressed: () {  },
                          style: ElevatedButton.styleFrom(primary: Colors.green),
                        child: Text('Approved'),),)
                  ),
                  Card(
                    child: ListTile(title: Text("List Item 2"), subtitle: Text("20-07-2020"),
                     trailing: ElevatedButton(onPressed: () {  },
                       style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                      child: Text('Pending'),),
                    ),
                  ),
                  Card(
                      child: ListTile(
                        title: Text("List Item 3"),subtitle: Text("20-07-2020"),
                        trailing: ElevatedButton(onPressed: () {  },
                          style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                          child: Text('Rejected'),),
                      )
                  ),
                  Card(
                      child: ListTile(
                        title: Text("List Item 4"),subtitle: Text("21-07-2020"),
                        trailing: ElevatedButton(onPressed: () {  },
                          style: ElevatedButton.styleFrom(primary: Colors.green),
                          child: Text('Rejected'),),
                      )
                  ),
                  Card(
                      child: ListTile(
                        title: Text("List Item 5"),subtitle: Text("22-07-2020"),
                        trailing: ElevatedButton(onPressed: () {  },
                          style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                          child: Text('Rejected'),),
                      )
                  ),
                  Card(
                      child: ListTile(
                        title: Text("List Item 6"),subtitle: Text("23-07-2020"),
                        trailing: ElevatedButton(onPressed: () {  },
                          style: ElevatedButton.styleFrom(primary: Colors.green),

                          child: Text('Rejected'),),
                      )
                  ),
                ],
                padding: EdgeInsets.all(10),
              ),
            )
          ],
        ),
        //),

      ),

    );

  }
}


