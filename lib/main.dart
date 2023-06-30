// @dart=2.9
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:test_app/SecondScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key,  this.title}) : super(key: key);
  final String title;
  @override
  State<SplashScreen> createState() => SplashScreen1();
}

class SplashScreen1 extends State<SplashScreen> {
  void initState() {
    super.initState();

    Timer(Duration(seconds: 1),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => SecondScreen(),
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:SvgPicture.asset('assets/icons/ic_logo.svg',matchTextDirection: false,height: 5, width: 5,
            fit: BoxFit.scaleDown),
    );
  }
}
