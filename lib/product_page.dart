import 'package:flutter/material.dart';
import 'package:reunited/components/picture_place_holder.dart';
import 'package:reunited/constants.dart';

import 'components/text_with_custom_underline.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final double price;
  final String picAddr;
  const ProductPage(
      {super.key,
      required this.title,
      required this.price,
      required this.picAddr});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: backgroundColor,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleWithCustomUnderline(
                                  text: "About the product",
                                  color: backgroundColor,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Price: \$ $price\nShop: Joe's Plantation",
                                  style: const TextStyle(color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Introducing our premium toilet paper - the ultimate combination of softness, strength, and absorbency. Made from high-quality materials, our toilet paper is designed to provide you with a comfortable and hygienic bathroom experience every time.",
                                  style: TextStyle(color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TitleWithCustomUnderline(
                                  text: "Pictures",
                                  color: backgroundColor,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                    child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(children: [
                                          PicturePlaceHolder(picAddr: picAddr)
                                        ]))),
                                const SizedBox(
                                  height: 20,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          _buildPopupDialog(context),
                                    );
                                  },
                                  child: Container(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width - 40,
                                    margin: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                              color: backgroundColor,
                                              spreadRadius: 1,
                                              blurRadius: 8,
                                              offset: const Offset(4, 4)),
                                          const BoxShadow(
                                              color: Colors.white,
                                              spreadRadius: 2,
                                              blurRadius: 8,
                                              offset: Offset(-4, -4)),
                                        ]),
                                    child: const Center(
                                      child: Text(
                                        "Buy now!",
                                        style: TextStyle(
                                            letterSpacing: 2,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Purchase Successful'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
