import 'package:flutter/material.dart';
import 'classes.dart';

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
        title: Text(e.name, style: biggerFont),
        // minVerticalPadding: 40.0,
        leading: const Icon(Icons.subject));
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
