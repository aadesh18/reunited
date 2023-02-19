import 'package:flutter/material.dart';
import 'package:reunited/components/announcement_card.dart';
import 'package:reunited/constants.dart';

class AnnouncementsPage extends StatefulWidget {
  const AnnouncementsPage({super.key});

  @override
  State<AnnouncementsPage> createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: getAppbar(),
      ),
      floatingActionButton: getFloatingButton(),
      body: getBody(),
    );
  }

  Widget getFloatingButton() {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }

  Widget getAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      title: const Text("Announcements",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            SizedBox(
              height: 20,
            ),
            AnnouncementCard(
                title: "Shooting heard at Baltimore Avenue",
                description:
                    "At 5.30 pm, I heard shooting near the target store, right next to the adidas store..."),
            SizedBox(
              height: 20,
            ),
            AnnouncementCard(
                title: "FLASHER  ALERT!",
                description:
                    "An old man at the corner adjacent to the Irebe is flashing everyone who is passing by.."),
            SizedBox(
              height: 20,
            ),
            AnnouncementCard(
                title: "Shooting heard at Baltimore Avenue",
                description:
                    "At 5.30 pm, I heard shooting near the target store, right next to the adidas store..."),
            SizedBox(
              height: 20,
            ),
            AnnouncementCard(
                title: "Theft at the Alloy",
                description:
                    "I live in the apartment 2801 at the Alloy. I had locked the apartment, but when I came back..."),
            SizedBox(
              height: 20,
            ),
            AnnouncementCard(
                title: "Shooting heard at Baltimore Avenue",
                description:
                    "At 5.30 pm, I heard shooting near the target store, right next to the adidas store..."),
          ],
        ),
      ),
    );
  }
}
