import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nazymproject/colors.dart';

import '../details/RestaurantDetails.dart';
import 'AllRestaurants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String selectedCity = 'Algiers';
  final List<String> cities = ['Algiers', 'Oran', 'Constantine', 'Annaba', 'Blida'];

  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.local_pizza, 'name': 'Pizza'},
    {'icon': Icons.ramen_dining, 'name': 'Noodle'},
    {'icon': Icons.lunch_dining, 'name': 'Burger'},
    {'icon': Icons.rice_bowl, 'name': 'Rice'},
    {'icon': Icons.restaurant, 'name': 'Seafood'},
  ];

  final List<Map<String, dynamic>> restaurants = [
    {
      'name': 'Burger House Algiers',
      'rating': 4.5,
      'reviews': '1.5k',
      'address': '123 Ave',
      'time': '25 - 35 mins',
      'image': 'assets/images/tinbox.jpg',
    },
    {
      'name': 'Pizza Palace',
      'rating': 4.3,
      'reviews': '2.1k',
      'address': '456 Ave',
      'time': '20 - 30 mins',
      'image': 'assets/images/tinbox.jpg',
    },
    {
      'name': 'Mediterranean Delight',
      'rating': 4.7,
      'reviews': '980',
      'address': '789 Ave',
      'time': '30 - 45 mins',
      'image': 'assets/images/tinbox.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // blue container at top
            Container(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
              color: AppColors.bluecolor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      const Text(
                        'Restaurants in',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      DropdownButton<String>(
                        value: selectedCity,
                        dropdownColor: AppColors.bluecolor,
                        style: const TextStyle(color: Colors.white),
                        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                        underline: Container(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCity = newValue!;
                          });
                        },
                        items: cities.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Center(
                      child: Image.asset('assets/images/maklamapno.png',

                        fit: BoxFit.cover,
                      ),

                    ),),
                ],
              ),
            ),

            // Search box
            Transform.translate(
              offset: const Offset(0, -25),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Where do you want to eat?',
                    prefixIcon: Padding(
                      padding:  EdgeInsets.only(left: 10, right: 10), //  icon padding
                      child: Icon(Icons.search),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 20), // Adjust vertical padding for text
                  ),
                ),
              ),
            ),


            ///////////////Categories/////////////////
            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryItem(
                    icon: categories[index]['icon'],
                    name: categories[index]['name'],
                  );
                },
              ),
            ),
            SizedBox(height:20 ,),
            ////// Restaurants header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Restaurants ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  AllRestaurantsPage(),
                        ),
                      );
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(color: AppColors.bluecolor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),

            // Restaurant cards
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RestaurantDetail()),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: restaurants.map((restaurant) => RestaurantCard(
                    restaurant: restaurant,
                  )).toList(),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String name;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: const Offset(2.0, 2.0),
                  blurRadius: 5.0,
                  spreadRadius: 0.0,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ),
              ],
            ),
            child: Icon(icon
            ,
            color: AppColors.yellowcolor,),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final Map<String, dynamic> restaurant;

  const RestaurantCard({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              restaurant['image'],
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant['name'],
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 20),
                    Text(
                      ' ${restaurant['rating']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' (${restaurant['reviews']})',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    Text(
                      ' • ${restaurant['address']}',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 16, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text(
                      restaurant['time'],
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



//////////////////////////////////////////////////////////////////


