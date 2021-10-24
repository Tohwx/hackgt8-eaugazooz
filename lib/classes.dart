import 'package:flutter/material.dart';

List<Event> items = [
  Event("Event A", "Yes", true, true, 1.0),
  Event("Event B", "Yes", true, true, 1.0)
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

  Event(this.name, this.type, this.hasFood, this.hasSwag, this.progress);
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
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _createTile(items[index]);
        });
  }

  Widget _createTile(Event e) {
    return ListTile(title: Text(e.name, style: _biggerFont));
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

class LeaderboardTab extends StatefulWidget {
  const LeaderboardTab({Key? key}) : super(key: key);

  @override
  _LeaderboardTabState createState() => _LeaderboardTabState();
}

class _LeaderboardTabState extends State<LeaderboardTab> {
  @override
  Widget build(BuildContext context) {
    return Container();
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
            EventsTab(),
            Map(),
            LeaderboardTab(),
          ],
        ),
      ),
    );
  }
}
