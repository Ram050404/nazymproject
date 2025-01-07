import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon ;
  final Color backgroundColor;
  final Color IconColor;
  final double size;
  final VoidCallback onTap;


  AppIcon({super.key, required this.icon,  this.backgroundColor= const Color(0xFFfcf4e4),  this.IconColor= const Color(0xFF756d54),  this.size=40, required this.onTap});

  @override
  // Widget build(BuildContext context) {
  //return Container(
  //   width: size ,
  //   height: size,

  //  decoration: BoxDecoration(
  //    borderRadius: BorderRadius.circular(size/2),
  //    color: backgroundColor,

  //   ),
  //       child:Icon(
  //         icon,
  //        color: IconColor,
  //        size: 16,
  //    ) ,
  //);
  //}
//}

  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Trigger the onTap action
      borderRadius: BorderRadius.circular(size / 2), // Border radius for ripple effect
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: backgroundColor,
        ),
        child: Icon(
          icon,
          color: IconColor,
          size: size / 2, // Adjust size to fit icon nicely
        ),
      ),
    );
  }
}
