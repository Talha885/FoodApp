import 'package:flutter/material.dart';
import 'package:foodapp/models/food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
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

  final List _cart = [];

  List get foodMenu => _foodMenu;
  List get cart => _cart;

  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners(); // Notify listeners after modifying the cart
  }
}
