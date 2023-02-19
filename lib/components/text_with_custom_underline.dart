import 'package:flutter/material.dart';

class TitleWithCustomUnderline extends StatelessWidget {
  final String text;
  final Color color;
  const TitleWithCustomUnderline(
      {Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(right: 5),
              height: 7,
              color: color.withOpacity(0.4),
            ),
          )
        ],
      ),
    );
  }
}
