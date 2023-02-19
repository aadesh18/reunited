import 'package:flutter/material.dart';

class PicturePlaceHolder extends StatelessWidget {
  final String picAddr;
  const PicturePlaceHolder({super.key, required this.picAddr});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        top: 10,
        bottom: 10,
      ),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 185,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(picAddr),
    );
  }
}
