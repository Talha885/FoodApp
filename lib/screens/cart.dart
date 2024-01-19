// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:foodapp/models/food.dart';
import 'package:foodapp/models/shop.dart';
import 'package:foodapp/models/mybutton.dart';

import 'package:foodapp/themes/colors.dart';

import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int quantityCount = 1;

  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, shop, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          elevation: 0,
          foregroundColor: Colors.white,
          title: Center(child: const Text('My Cart')),
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: shop.cart.length,
                itemBuilder: (context, index) {
                  final Food? food = shop.cart[index];
                  final String foodName = food?.name ?? '';
                  final String foodPrice = food?.price ?? '';
                  final String foodImagePath = food?.imagePath ?? '';

                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20.0),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      // Remove the item from the data source
                      context.read<Shop>().removeFromCart(food!);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      margin:
                          const EdgeInsets.only(left: 20, top: 20, right: 20),
                      child: ListTile(
                        leading: SizedBox(
                          height: 50,
                          width: 50,
                          child: foodImagePath.isNotEmpty
                              ? Image.asset(foodImagePath, fit: BoxFit.cover)
                              : Container(),
                        ),
                        title: Text(foodName),
                        subtitle: Text(foodPrice),
                        trailing: _buildQuantityButtons(), // Add this function
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Color.fromARGB(255, 71, 37, 37),
              ),
              height: 225,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Taxes:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          '0.00',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Delivery Fees:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          '0.00',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 1,
                      child: Container(
                        color: Colors.pink,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Total:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          '0.00',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: MyButton(
                        text: 'Checkout',
                        onTap: () {
                          Navigator.pushNamed(context, '/billingpage');
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            decrementQuantity();
          },
        ),
        Text(
          quantityCount.toString(), // Show quantity count here
          style: TextStyle(fontSize: 16),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            incrementQuantity();
          },
        ),
      ],
    );
  }
}
