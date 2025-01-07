
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nazymproject/colors.dart';
import 'package:nazymproject/home/HomePage.dart';





class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the HomePage after 3 seconds
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber[50],
        backgroundColor:AppColors.yellowcolor,

        body: Center(
          child: Container(
            height: 300,
            width: 300,
            child: Center(
              child: Image.asset('assets/images/maklamap.png',

                fit: BoxFit.cover,
              ),

            ),

          ),
        )
    );
  }
}

