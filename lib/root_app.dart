import 'package:flutter/material.dart';
import 'package:reunited/announcements_page.dart';
import 'package:reunited/constants.dart';
import 'package:reunited/map_page.dart';
import 'package:reunited/profile_page.dart';
import 'package:reunited/shopping_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int currIndex = 0;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: IndexedStack(
        index: currIndex,
        children: const [
          MapPage(),
          AnnouncementsPage(),
          ShoppingPage(),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 8, right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: SalomonBottomBar(
          currentIndex: currIndex,
          onTap: (i) => setState(() => currIndex = i),
          items: [
            /// Map
            SalomonBottomBarItem(
              icon: const Icon(Icons.location_on),
              title: const Text("Near you"),
              selectedColor: Colors.purple,
            ),

            /// Annoucements
            SalomonBottomBarItem(
              icon: const Icon(Icons.campaign),
              title: const Text("Announcements"),
              selectedColor: Colors.pink,
            ),

            /// Shop
            SalomonBottomBarItem(
              icon: const Icon(Icons.shopping_bag_rounded),
              title: const Text("Shop"),
              selectedColor: Colors.orange,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.person_rounded),
              title: const Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
