import 'package:flutter/material.dart';
import 'package:reunited/constants.dart';

class AnnouncementCard extends StatefulWidget {
  final String title;
  final String description;
  const AnnouncementCard(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  State<AnnouncementCard> createState() => _AnnouncementCardState();
}

class _AnnouncementCardState extends State<AnnouncementCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight! / 8,
      width: screenWidth! - 30,
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
            Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.description,
            )
          ],
        ),
      ),
    );
  }
}
