

import 'package:flutter/material.dart';
import 'package:nazymproject/colors.dart';
import 'package:nazymproject/home/HomePage.dart';

import '../widgets/app_icon.dart';
import '../widgets/app_icon2.dart';






class restaurantDetail extends StatelessWidget {
  const restaurantDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 350,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/tinbox.jpg')
                  )
              ),
            ),

          ),
          Positioned(
              top: 40,
              left: 20,
              right : 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                    onTap:() {
                      // Use Navigator to push to the new page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                  //SizedBox(width: 6,),
                  AppIcon2(icon: Icons.favorite_border_rounded)
                ],

              )
          ),
          Positioned(
              left: 0,
              right: 0,
              top: 330,
              child: Container(
                padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( 'yum yum yum yum yum '),
                    SizedBox(height: 10,),
                    Text('blah blah blah'),
                    SizedBox(height: 30,),

                    Container(
                        padding: EdgeInsets.only(left: 10, right: 20),
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {

                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.bluecolor,),
                              child: Text(
                                'meow',
                                style: TextStyle(
                                  color: Colors.white,
                                ),

                              ),

                            ),
                            SizedBox(width: 10,),
                            ElevatedButton(
                              onPressed: () {
                                print("Button pressed!");
                              },
                              style: ElevatedButton.styleFrom(

                              ),
                              child: Text('meow',
                                style: TextStyle(
                                  color: AppColors.yellowcolor,
                                ),),

                            ),
                            SizedBox(width: 10,),
                            ElevatedButton(
                              onPressed: () {

                                print("Button pressed!");
                              },
                              style: ElevatedButton.styleFrom(

                              ),
                              child: Text('meow'
                                ,
                                style: TextStyle(
                                  color: AppColors.yellowcolor,
                                ),),

                            ),
                          ],
                        )
                      // here add a button
                    ),
                    SizedBox(height: 20,),

                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('fbsjebfjsb sefbjbufujsb bfsbcjbs jsbcjsdjv bsvjb fjsncjbfr bvsjbviks', ),
                          SizedBox(height: 10,),
                          Text( 'fbsjebfjsb sefbjbufujsb bfsbcjbs jsbcjsdjv bsvjb ', ),
                        ],


                      ),

                    )

                  ],

                ),
              )
          )
        ],
      ),
    );
  }
}
