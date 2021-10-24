import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Opportuno',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Opportuno Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // Stateful home page, meaning that it has a State object
  // that contains fields that affect how it looks.

  // This class is the configuration for the state. It holds the values (such the title)
  // provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _pushSettings() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      return Scaffold(
        appBar: AppBar(title: Text('Map view'), leading: CloseButton()),
        body: Map(),
      );
    }));
  }

  void _pushAddNew() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      return Scaffold(
        appBar: AppBar(title: const Text('Submit something!')),
        body: const Text("insert body here"), // DEVAUGHN FORM HERE
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Opportuno'),
          actions: [
            IconButton(icon: const Icon(Icons.map), onPressed: _pushSettings)
          ],
          bottom: const TabBar(
            indicatorColor: Colors.amber,
            tabs: [
              Tab(icon: Icon(Icons.home)),
              //Tab(icon: Icon(Icons.map)),
              Tab(icon: Icon(Icons.leaderboard)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            EventsTab(),
            LeaderboardTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            label: Text("Add something!"),
            onPressed: _pushAddNew,
            icon: Icon(Icons.add)),
      ),
    );
  }
}
