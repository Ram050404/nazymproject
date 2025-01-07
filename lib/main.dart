import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nazymproject/SplashScreen.dart';
import 'package:nazymproject/account/LoginPage.dart';

import 'details/RestaurantDetails.dart';
import 'home/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home:  RestaurantDetail(),
    );
  }
}
