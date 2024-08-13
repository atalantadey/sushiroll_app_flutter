import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiroll/components/my_button.dart';
import 'package:sushiroll/models/food.dart';
import 'package:sushiroll/models/shop.dart';
import 'package:sushiroll/themes/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove from cart
  void removeFromCart(Food food, BuildContext context) {
    //get access to the shop
    final shop = context.read<Shop>();
    //remove from the cart
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: const Text('My Cart'),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    //get the food from the cart
                    final Food food = value.cart[index];
                    //get food name
                    final String foodName = food.name;
                    //get food price
                    final String foodPrice = food.price;
                    //return list tile UI
                    return Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 204, 112, 105),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 24),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ListTile(
                        title: Text(
                          foodName,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 23),
                        ),
                        subtitle: Text(
                          foodPrice,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        trailing: IconButton(
                            onPressed: () => removeFromCart(food, context),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            )),
                      ),
                    );
                  }),
            ),
            //PAY BTN
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(text: 'Pay Now ', ontap: () {}),
            )
          ],
        ),
      ),
    );
  }
}
