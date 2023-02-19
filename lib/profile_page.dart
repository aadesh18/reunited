import 'package:flutter/material.dart';
import 'package:reunited/components/profile_page_card.dart';
import 'package:reunited/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundColor,
          title: const Text("Profile",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            ProfilePageCard(title: "Profile", onPressed: () {}),
            const SizedBox(
              height: 40,
            ),
            ProfilePageCard(title: "Purchase history", onPressed: () {}),
            const SizedBox(
              height: 40,
            ),
            ProfilePageCard(title: "Location settings", onPressed: () {}),
            const SizedBox(
              height: 40,
            ),
            ProfilePageCard(title: "About Us", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
