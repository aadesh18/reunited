import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:reunited/chat_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButton: getFloatingButton(),
        body: getBody());
  }

  Widget getBody() {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
              center: LatLng(51.509364, -0.128928),
              zoom: 15,
              maxZoom: 20,
              interactiveFlags: InteractiveFlag.all),
          nonRotatedChildren: [
            AttributionWidget.defaultWidget(
              source: 'OpenStreetMap contributors',
              onSourceTapped: null,
            ),
          ],
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            CircleLayer(
              circles: [
                CircleMarker(
                    point: LatLng(51.509364, -0.128928),
                    radius: 20.0,
                    color: Colors.red.withOpacity(0.5),
                    borderColor: Colors.black)
              ],
            ),
            CircleLayer(
              circles: [
                CircleMarker(
                    point: LatLng(51.519364, -0.128928),
                    radius: 25.0,
                    color: Colors.green.withOpacity(0.5),
                    borderColor: Colors.black)
              ],
            ),
            CircleLayer(
              circles: [
                CircleMarker(
                    point: LatLng(51.49999, -0.128928),
                    radius: 50.0,
                    color: Colors.blue.withOpacity(0.5),
                    borderColor: Colors.black)
              ],
            ),
            CircleLayer(
              circles: [
                CircleMarker(
                    point: LatLng(51.5000, -0.148928),
                    radius: 50.0,
                    color: Colors.red.withOpacity(0.5),
                    borderColor: Colors.black)
              ],
            ),
            CircleLayer(
              circles: [
                CircleMarker(
                    point: LatLng(51.5080, -0.121111),
                    radius: 50.0,
                    color: Colors.purple.withOpacity(0.5),
                    borderColor: Colors.black)
              ],
            ),
            CircleLayer(
              circles: [
                CircleMarker(
                    point: LatLng(51.5050, -0.141111),
                    radius: 50.0,
                    color: Colors.green.withOpacity(0.5),
                    borderColor: Colors.black)
              ],
            )
          ],
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: const EdgeInsets.only(left: 20, bottom: 50),
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Unsafe",
                    style: TextStyle(color: Colors.red),
                  ),
                  Text("Local Business",
                      style: TextStyle(color: Colors.purple)),
                  Text("Eco-friendly", style: TextStyle(color: Colors.green)),
                  Text("Community Volunteering",
                      style: TextStyle(color: Colors.blue))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getFloatingButton() {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: ((context) {
              return const ChatPage();
            }));
      },
      child: const Icon(Icons.chat_bubble_outline),
    );
  }
}
