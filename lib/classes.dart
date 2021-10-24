import 'package:flutter/material.dart';

// Event class
class Event extends StatelessWidget {
  // fields
  String name = "Default name";
  String type = "Food";

  Event(this.name, this.type);
}


// List of events to display
class EventsTab extends StatefulWidget {
  const EventsTab({ Key? key }) : super(key: key);

  @override
  _EventsTabState createState() => _EventsTabState();
}

class _EventsTabState extends State<EventsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}


// Map display
class Map extends StatefulWidget {
  const Map({ Key? key }) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
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
