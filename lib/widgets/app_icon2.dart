import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppIcon2 extends StatelessWidget {
  final IconData icon ;
  final Color backgroundColor;
  final Color IconColor;
  final double size;



  AppIcon2({super.key, required this.icon,  this.backgroundColor= const Color(0xFFfcf4e4),  this.IconColor= const Color(0xFF756d54),  this.size=40});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor,

      ),
      child:Icon(
        icon,
        color: IconColor,
        size: 16,
      ) ,
    );
  }
}
