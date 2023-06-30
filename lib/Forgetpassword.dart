import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:test_app/ResetPassword.dart';
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

      home: const ForgetPassword(),
    );
  }
}

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);
  @override
  State<ForgetPassword> createState() => ForgetPassword1();
}

class ForgetPassword1 extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool showpassword=false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(10),
          child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/icons/ic_logo.svg',),
              Row(
                children: [
                  Text('C&W ',style: TextStyle(fontSize: 25, color: Colors.green),),
                  Text('Baluchistan ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.green),),
                ],
              ) ,
              Text('Forget Password',style: TextStyle(fontSize: 25,fontWeight: FontWeight.normal, color: Colors.green),),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.green),borderRadius: BorderRadius.circular(10.0),),
                child: Form(
                  key: formKey,

                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    children: [
                      SizedBox(height: 25.0),
                      Text('Email'),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: emailController,
                        style:TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,),
                        decoration:  InputDecoration(
                          hintText: ' Enter Email',
                          hintStyle: TextStyle(fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(23.0)
                          ),
                          contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Some Text';}
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
                            child: Text('Send Link',style: TextStyle(color: Colors.white),),
                            onPressed: (){
                              if (formKey.currentState!.validate()) {
                                Navigator.of (context).push(MaterialPageRoute(builder: (context)=>ResetPassword()),);
                                // If the form is valid, display a snackbar. In the real world,
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Link send')),);}
                            }
                        ),),
                      SizedBox(height: 25.0),

                    ],
                  ),

                ),)

            ],
          ),
    ),

        )
    );

  }
}
