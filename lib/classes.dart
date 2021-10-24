import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

List<Event> items = [
  Event.withParams("HackGT8", "Yes", true, true, 1.0),
  Event.withParams("VSA moon festival", "Yes", true, true, 1.0),
  Event.nameOnly("Event C"),
  Event.nameOnly("Event D1"),
  Event()
];

List<User> users = [
  User(),
  User.allParams("joe", 700),
  User.allParams("amanda", 50),
  User.allParams("boisson", 800)
];

const _biggerFont = const TextStyle(fontSize: 18.0);

// Event class
class Event {
  // fields
  String name = "Default name";
  String type = "Food";

  bool hasFood = false;
  bool hasSwag = false;

  double progress = 1.0;

  Event();

  Event.nameOnly(this.name);

  Event.withParams(
      this.name, this.type, this.hasFood, this.hasSwag, this.progress);
}

class User {
  String name = "unnamed";
  int karma = 0;

  User();

  User.allParams(this.name, this.karma);
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
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _createTile(items[index]);
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }

  Widget _createTile(Event e) {
    return ListTile(
        title: Text(e.name, style: _biggerFont),
        // minVerticalPadding: 40.0,
        leading: const Icon(Icons.subject));
  }
}

// Map display
class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.77551715463846, -84.39559957027134),
    zoom: 10, // 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 0,
      target: LatLng(33.77551715463846, -84.39559957027134),
      tilt: 0,
      zoom: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

class LeaderboardTab extends StatefulWidget {
  const LeaderboardTab({Key? key}) : super(key: key);

  @override
  _LeaderboardTabState createState() => _LeaderboardTabState();
}

class _LeaderboardTabState extends State<LeaderboardTab> {
  @override
  Widget build(BuildContext context) {
    users.sort((a, b) => b.karma.compareTo(a.karma));
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, i) {
        return ListTile(
            title: Text(users[i].name),
            leading: Icon(Icons.face),
            trailing: Text("Karma: " + users[i].karma.toString()));
      },
    );
  }
}
