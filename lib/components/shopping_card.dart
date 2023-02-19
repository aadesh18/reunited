import 'package:flutter/material.dart';
import 'package:reunited/constants.dart';
import 'package:reunited/product_page.dart';

class ShoppingCard extends StatefulWidget {
  final String title;
  final double price;
  final String picAddr;
  const ShoppingCard(
      {super.key,
      required this.title,
      required this.price,
      required this.picAddr});

  @override
  State<ShoppingCard> createState() => ShoppingCardState();
}

class ShoppingCardState extends State<ShoppingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight! / 4.5,
      width: screenWidth! / 2.3,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 15,
                offset: const Offset(0, 1))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductPage(
                          title: widget.title,
                          price: widget.price,
                          picAddr: widget.picAddr,
                        ),
                      ));
                },
                child: Container(
                  height: screenHeight! / 9,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.asset(widget.picAddr),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "\$ ${widget.price.toString()}",
            )
          ],
        ),
      ),
    );
  }
}
