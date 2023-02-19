import 'package:flutter/material.dart';
import 'package:reunited/components/shopping_card.dart';
import 'package:reunited/constants.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: getAppbar(),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Wrap(
              runSpacing: 20,
              spacing: 20,
              children: const [
                ShoppingCard(
                  title: "Eco-friendly Toilet Paper",
                  price: 12.99,
                  picAddr: "assets/1.jpg",
                ),
                ShoppingCard(
                  title: "Eco-friendly Dish Brush",
                  price: 11.99,
                  picAddr: "assets/2.jpg",
                ),
                ShoppingCard(
                  title: "Eco-friendly Cotton Swabs",
                  price: 7.99,
                  picAddr: "assets/3.jpg",
                ),
                ShoppingCard(
                  title: "Eco-friendly Toothbrush",
                  price: 9.98,
                  picAddr: "assets/4.jpg",
                ),
                ShoppingCard(
                  title: "Custom Coasters",
                  price: 45.0,
                  picAddr: "assets/5.jpg",
                ),
                ShoppingCard(
                  title: "Eucalytus Oil",
                  price: 11.49,
                  picAddr: "assets/6.jpg",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      title: const Text("Shopping",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }
}
