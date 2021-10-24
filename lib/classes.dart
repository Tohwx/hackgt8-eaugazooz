import 'package:flutter/material.dart';

class Event {
  // fields
  String name = "Default name";
  String type = "Food";

  Event(this.name, this.type);
}

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
