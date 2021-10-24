import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

// Event class
class Event {
  // fields
  String name = "Default name";
  String type = "Food";

  bool hasFood = false;
  bool hasSwag = false;

  double progress = 1.0;

  Event(this.name, this.type, this.hasFood, 
        this.hasSwag, this.progress);
}

// List of events to display
class EventsTab extends StatefulWidget {
  const EventsTab({Key? key}) : super(key: key);

  @override
  _EventsTabState createState() => _EventsTabState();
}

class _EventsTabState extends State<EventsTab> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// Map display
class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}


// TabBarMenu on home page
class TabBarMenu extends StatelessWidget {
  const TabBarMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            indicatorColor: Colors.amber,
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.map)),
              Tab(icon: Icon(Icons.leaderboard)),
            ],
          ),
          title: const Text('Opportuno'),
        ),
        body: const TabBarView(
          children: [
            Icon(Icons.home),
            Icon(Icons.map),
            Icon(Icons.leaderboard),
          ],
        ),
      ),
    );
  }
}
