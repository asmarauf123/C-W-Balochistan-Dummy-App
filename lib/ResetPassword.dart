import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:test_app/SecondScreen.dart';
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

      home: const ResetPassword(),
    );
  }
}

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);
  @override
  State<ResetPassword> createState() => ResetPassword1();
}

class ResetPassword1 extends State<ResetPassword> {

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool showpassword=false;
  bool showpassword1=false;
  @override
  void showAlertDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AlertDialog(
              title: Column(
                children: [
                  SvgPicture.asset('assets/icons/ic_successful.svg', width: 50, height: 50, fit: BoxFit.contain,)
                ],),
              content: const Text('Password Updated Successfuly'),
              actions: [
                Container(
                  alignment: Alignment.center,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green,),
                    onPressed: () {
                      // Navigator.pop(context);
                      Navigator.of (context).push(MaterialPageRoute(builder: (context)=>SecondScreen()),);
                    },
                    child: const Text('ok')
                ),)

              ],

            ),
          );
        });
  }
  Widget build(BuildContext context) {
    return  Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/icons/ic_logo.svg',),
              Text('C&W BALOCHISTAN',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.green),),
              Text('Reset Password',style: TextStyle(fontSize: 25,fontWeight: FontWeight.normal, color: Colors.green),),
              SizedBox(height: 40,),
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.green),borderRadius: BorderRadius.circular(20.0),),
                child: Form(
                  key: formKey,

                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    children: [
                      SizedBox(height: 10.0),
                      Text('Password'),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: passwordController,
                        style:TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,),
                        decoration: InputDecoration(hintText: 'Enter Paassword',
                          hintStyle: TextStyle(fontSize: 15),
                          suffixIcon: GestureDetector(
                            onTap:(){
                              setState((){
                                showpassword=! showpassword;});
                            },
                            child: Icon(
                                showpassword ? Icons.visibility: Icons.visibility_off),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)
                          ),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),),
                        obscureText: !showpassword,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                          {return 'Please Enter Some Text';}
                          return null;},
                      ),
                      SizedBox(height: 10,),
                      Text('Confirm Password',),
                      SizedBox(height: 5.0),
                      TextFormField(
                        controller: confirmpasswordController,
                        style:TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,),
                        decoration: InputDecoration(hintText: 'Renter Paassword',
                          hintStyle: TextStyle(fontSize: 15),
                          suffixIcon: GestureDetector(
                            onTap:(){
                              setState((){
                                showpassword1=! showpassword1;});
                            },
                            child: Icon(
                                showpassword1 ? Icons.visibility: Icons.visibility_off),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)
                          ),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),),
                        obscureText: !showpassword1,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                          {return 'Please Enter Some Text';}
                          return null;},
                      ),

                      SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.center,
                        child:ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(200, 50),
                              maximumSize: const Size(200, 50),
                              primary: Colors.green,
                              shape: StadiumBorder(),
                            ),
                            child: Text('Update',style: TextStyle(color: Colors.white),),
                            onPressed: (){
                              if (passwordController.text!=confirmpasswordController.text) {
                                // If the form is valid, display a snackbar. In the real world,
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Credentials are not Right')),);
                              }
                              else {
                                showAlertDialog();
                                //Navigator.of (context).push(MaterialPageRoute(builder: (context)=>AlertBox()),);
                              }
                            }
                        ),),
                      SizedBox(height: 30,),

                    ],
                  ),

                ),)
            ],),
          ),
        )
    );

  }
}
