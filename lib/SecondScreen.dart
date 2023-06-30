import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:test_app/Forgetpassword.dart';

import 'Dashboard.dart';
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

      home: const SecondScreen(),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);
  @override
  State<SecondScreen> createState() => SecondScreen1();
}

class SecondScreen1 extends State<SecondScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool showpassword=false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Padding(
          padding: const EdgeInsets.all(10),

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                      SvgPicture.asset('assets/icons/ic_logo.svg',),
                  Row(
                    children: [
                      Text('C&W ',style: TextStyle(fontSize: 25, color: Colors.green),),
                      Text('Baluchistan ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.green),),
                    ],
                  ) ,
                  Text('Login to continue',style: TextStyle(fontSize: 25,fontWeight: FontWeight.normal, color: Colors.green),),
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
                    Text('Email'),
                    SizedBox(height: 10.0),
                    TextFormField(
                        controller: nameController,
                        style:TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,),
                    decoration:  InputDecoration(
                        hintText: 'Enter Email',
                      hintStyle: TextStyle(fontSize: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23.0)
                      ),
                      contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),),
                    validator: (value) {
                          //var email = "tony123_90874coder@gmail.com";
                          RegExp regex = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
                    if (value == null || value.isEmpty) {return 'Please Enter Some Text';}
                     else if(!regex.hasMatch(value)) {return 'Please Enter according to format';}
                    return null;},
                    ),
                    SizedBox(height: 20,),
                    Text('Password (Must start with capital letter or end with digits)',),
                    SizedBox(height: 5.0),
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
                        RegExp regex =
                        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        if (value == null || value.isEmpty) {return 'Please Enter Some Text';}
                        else if (value.length < 6){return 'Password should be minimum 7 characters';}
                        else if (!regex.hasMatch(value)) {return 'Enter valid password first letter must be capital and end with digits';}
                        return null;},
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      child:Text('Forget Password?',style: TextStyle(color: Colors.red),textAlign: TextAlign.right,),
                    onTap: ()=> Navigator.of (context).push(MaterialPageRoute(builder: (context)=>ForgetPassword()),),
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
                      child: Text('Login',style: TextStyle(color: Colors.white),),
                        onPressed: (){
                          if (formKey.currentState!.validate()) {
                            Navigator.of (context).push(MaterialPageRoute(builder: (context)=> Dashboard()));
                            //Navigator.of (context).push(MaterialPageRoute(builder: (context)=>));
                            // If the form is valid, display a snackbar. In the real world,
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Credentials are Right')),

                            );
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
