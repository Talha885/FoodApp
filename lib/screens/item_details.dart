import 'package:flutter/material.dart';
import 'package:foodapp/models/shop.dart';
import 'package:foodapp/models/food.dart';
import 'package:foodapp/models/mybutton.dart';
import 'package:foodapp/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemDetail extends StatefulWidget {
  final Food food;
  const ItemDetail({super.key, required this.food});

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  int quantityCount = 1;
  double totalPrice = 200;

  @override
  void initState() {
    super.initState();
    // Convert widget.food.price to double before calculation
    double foodPrice = double.parse(widget.food.price);
    totalPrice = foodPrice * quantityCount;
  }

  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
        updateTotalPrice();
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
      updateTotalPrice();
    });
  }

  void updateTotalPrice() {
    setState(() {
      double foodPrice = double.parse(widget.food.price);
      totalPrice = foodPrice * quantityCount;
    });
  }

  void addToCart() {
    if (quantityCount > 0) {
      final shop = context.read<Shop>();

      shop.addToCart(widget.food, quantityCount);

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: const Text(
            'Added to cart',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.done,
                  color: Colors.white,
                ))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                Image.asset(
                  widget.food.imagePath,
                  height: 200,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[800],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.food.rating,
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.food.name,
                  style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'Description',
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Introducing our signature deluxe burger, a culinary masterpiece crafted to tantalize your taste buds and redefine your burger experience. Picture this: a freshly baked brioche bun, toasted to golden perfection, embracing a succulent, handcrafted beef patty, grilled to juicy tenderness. Each bite promises a symphony of flavors as the premium beef meets the savory touch of melted aged cheddar cheese, oozing indulgently over the patty.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.grey[600], fontSize: 14, height: 2),
                )
              ],
            ),
          )),
          Container(
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rs.${widget.food.price}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 85, 37, 37),
                                borderRadius: BorderRadius.circular(25)),
                            child: IconButton(
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onPressed: decrementQuantity,
                            ),
                          ),
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(
                                quantityCount.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 85, 37, 37),
                                borderRadius: BorderRadius.circular(25)),
                            child: IconButton(
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: incrementQuantity,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'TOTAL : Rs.${totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MyButton(
                    text: 'Add to Cart',
                    onTap: addToCart,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
