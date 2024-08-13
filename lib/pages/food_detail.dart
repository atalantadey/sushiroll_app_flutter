import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushiroll/components/my_button.dart';
import 'package:sushiroll/models/food.dart';
import 'package:sushiroll/models/shop.dart';
import 'package:sushiroll/themes/colors.dart';

class FoodDetail extends StatefulWidget {
  final Food food;
  const FoodDetail({super.key, required this.food});

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
//quantity
  int quantityCount = 0;
//decrement Quantityt
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

//increment quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  //add to cart
  void addTOCart() {
    //only add to cart if there is something in the cart added
    if (quantityCount > 0) {
      //get access to the shop
      final shop = context.read<Shop>();

      //add to the cart
      shop.addToCart(widget.food, quantityCount);
      //let the user know
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: primaryColor,
                content: const Text(
                  'Item has been added to the Cart !',
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        //pop once to remove dialog box
                        Navigator.pop(context);
                        //pop again to go to prev screen
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.done,
                        color: Colors.white,
                      ))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TITLE'),
      ),
      body: Column(
        //listview of the food Details
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  //image
                  Image.asset(
                    widget.food.image,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //rating
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //food Name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 36),
                  ),
                  //description
                  const Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sushi is a traditional Japanese dish that combines vinegared rice with a variety of ingredients, most commonly raw or cooked seafood, but also vegetables and sometimes tropical fruits. It is known for its diverse presentations, including nigiri (hand-pressed rice topped with a slice of fish or other toppings), maki (rice and fillings rolled in seaweed and sliced into bite-sized pieces), sashimi (thinly sliced raw fish served without rice), and temaki (hand-rolled cones of seaweed filled with rice and other ingredients). Sushi is appreciated not only for its delicate flavors and textures but also for its aesthetic presentation.',
                    style: TextStyle(color: Colors.grey[600], height: 2),
                  )
                ],
              ),
            ),
          ),
          //price+quantity+button to add to cart
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                //price+quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.food.price}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        //minus btn
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: decrementQuantity,
                          ),
                        ),
                        //quantity count
                        SizedBox(
                          width: 20,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        //plus btn
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: incrementQuantity,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                //add to cart button
                MyButton(text: 'Add To Cart', ontap: addTOCart),
              ],
            ),
          )
        ],
      ),
    );
  }
}
