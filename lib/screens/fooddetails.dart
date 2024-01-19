import 'package:flutter/material.dart';
import 'package:foodapp/screens/item_details.dart';
import 'package:foodapp/models/food.dart'; // Import your Food model
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts if needed

class FoodDetailsPage extends StatefulWidget {
  const FoodDetailsPage({Key? key, required this.food}) : super(key: key);
  final Food food;

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  List proData = [
    {
      "name": "Burger1",
      "price": "123",
      "img": "images/burger.png",
    },
    {
      "name": "Burger2",
      "price": "1233",
      "img": "images/burger.png",
    },
    {
      "name": "Burger1",
      "price": "123",
      "img": "images/burger.png",
    },
    {
      "name": "Burger2",
      "price": "1233",
      "img": "images/burger.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              widget.food.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Image.asset(
            widget.food.imagePath,
            height: 200,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: proData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetail(
                          food: widget.food,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              proData[index]['img'],
                              height: 60,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.food.name,
                                  style:
                                      GoogleFonts.dmSerifDisplay(fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.food.price,
                                  style: const TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.favorite_outline,
                          size: 28,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
