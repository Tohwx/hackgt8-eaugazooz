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
    return Stack(children: <Widget>[
      ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _createTile(items[index]);
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
      const Align(
        alignment: Alignment.bottomLeft,
        child: Opacity(
          opacity: 0.1,
          child: Image(image: AssetImage('assets/buzzy.gif')),
        ),
      )
    ]);
  }

  Widget _createTile(Event e) {
    return ListTile(
      title: Text(e.name, style: biggerFont),
      // minVerticalPadding: 40.0,
      leading: const Icon(Icons.subject),
      trailing: _statusIcon(e),
      onTap: () {
        _tapEventTile(e);
      },
    );
  }

  Widget _statusIcon(Event e) {
    if (e.hasFood && e.hasSwag) {
      return Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[Icon(Icons.bakery_dining), Icon(Icons.redeem)]);
    } else if (e.hasFood) {
      return Icon(Icons.bakery_dining);
    } else if (e.hasSwag) {
      return Icon(Icons.redeem);
    } else {
      return Icon(Icons.sentiment_dissatisfied);
    }
  }

  void _tapEventTile(Event e) {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      List<String> allInstVars = [
        "Name: ",
        "Type: ",
        "Has food? ",
        "Has swag? ",
        "Current supply status"
      ];

      List<String> actualInst = [
        e.name,
        e.type,
        e.hasFood.toString(),
        e.hasSwag.toString(),
        e.progress.toString()
      ];

      return Scaffold(
          appBar: AppBar(title: Text("Event detail view")),
          body: ListView.separated(
            padding: const EdgeInsets.all(16.0),
            itemCount: allInstVars.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Text(allInstVars[index],
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  title: Text(actualInst[index]));
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          ));
    }));
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
            leading: const Icon(Icons.face),
            trailing: Text("Karma: " + users[i].karma.toString()));
      },
    );
  }
}
