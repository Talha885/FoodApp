import 'package:flutter/material.dart';
import 'package:foodapp/models/food.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({super.key, required this.food, required this.onTap});
  final Food food;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.only(
            left: 25,
          ),
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                food.imagePath,
                height: 140,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                food.name,
                style: GoogleFonts.dmSerifDisplay(fontSize: 20),
              ),
              SizedBox(
                width: 160,
                height: 50,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\Rs.' + food.price,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[800],
                          ),
                          Text(
                            food.rating,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
