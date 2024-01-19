// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:foodapp/drawer/orders.dart';
import 'package:foodapp/drawer/profile.dart';
import 'package:foodapp/screens/discountpage.dart';
import 'package:foodapp/screens/fooddetails.dart';
import 'package:foodapp/models/food.dart';
import 'package:foodapp/models/food_tile.dart';
import 'package:foodapp/models/mybutton.dart';
import 'package:foodapp/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Food> foodMenu = [
    Food(
        name: 'Burger',
        imagePath: 'images/burger.png',
        price: '200',
        rating: '4.5'),
    Food(
        name: 'Shawarma',
        imagePath: 'images/shawarma.png',
        price: '200',
        rating: '4.5'),
    Food(
        name: 'Salad',
        imagePath: 'images/salad.png',
        price: '200',
        rating: '4.5'),
    Food(
        name: 'Chicken',
        imagePath: 'images/chicken.png',
        price: '200',
        rating: '4.5'),
  ];

  String searchQuery = '';
  List filteredFoodMenu = [];

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Account'),
          content: Text('Are you sure you want to delete your account?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    filteredFoodMenu = foodMenu;
  }

  void filterFoodMenu(String query) {
    setState(() {
      searchQuery = query;
      if (query.isNotEmpty) {
        filteredFoodMenu = foodMenu
            .where(
                (food) => food.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredFoodMenu = foodMenu;
      }
    });
  }

  void _navigateToFoodDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FoodDetailsPage(food: filteredFoodMenu[index])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Center(
            child: Text(
          'Food App',
          style:
              TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
        )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(child: Image.asset('images/logo.png')),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Your Account'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyProfile()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person_pin),
            title: Text(
              'Orders',
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyOrders()),
              );
            },
          ),
          // contact share feedback
          ListTile(
            leading: Icon(Icons.call),
            title: Text(
              'Call Us',
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text(
              'Share',
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text(
              'Feedback',
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text(
              'Delete your Account',
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              _showDeleteAccountDialog(context);
            },
          ),
        ],
      )),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width - 60,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(horizontal: 25),
              padding: EdgeInsets.only(left: 25),
              child: Stack(
                children: [
                  Positioned(
                    right: -40,
                    bottom: 15,
                    child: Image.asset(
                      'images/logo.png',
                      height: 160,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        Text(
                          'Get Some Discount',
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 15),
                        MyButton(
                          text: 'Redeem',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DiscountPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 30),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                onChanged: (value) {
                  filterFoodMenu(value);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Search Here..',
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Text(
                    'Food Menu',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredFoodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                  food: filteredFoodMenu[index],
                  onTap: () {
                    _navigateToFoodDetails(index);
                  },
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: SizedBox(
                    height: 40,
                    child: Text(
                      'Hot',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(25)),
              margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'images/burger.png',
                        height: 60,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Burger',
                            style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Rs.200',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                  Icon(
                    Icons.favorite_outline,
                    size: 28,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
