import 'package:sushiroll/models/food.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  //FOOD MENU
  final List<Food> _foodMenu = [
    //tuna
    Food(
        image: 'lib/images/tuna.png',
        name: 'Tuna Sushi',
        price: '19.99',
        rating: '4.2'),
    //nigiri
    Food(
        image: 'lib/images/nigiri.png',
        name: 'Nigiri Sushi',
        price: '17.99',
        rating: '4.7'),
    //maki
    Food(
        image: 'lib/images/maki.png',
        name: 'Maki Sushi',
        price: '12.99',
        rating: '3.9'),
  ];

  //customer cart
  List<Food> _cart = [];
  //getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;
//add to cart
  void addToCart(Food fooditem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(fooditem);
    }
    notifyListeners();
  }

//remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
