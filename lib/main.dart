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
        // Try running your application with "flutter run".
        // Invoke "hot reload" press "r" in the console where you ran "flutter run"

        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Opportuno Home'),
    );
  }
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

    /*return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.map)),
                Tab(icon: Icon(Icons.leaderboard)),
              ],
            ),
            title: const Text('Tabs Demo'),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.home),
              Icon(Icons.map),
              Icon(Icons.leaderboard),
            ],
          ),
        ),
      ),
    );*/
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application.
  // It is stateful, meaning that it has a State object
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.

    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return TabBarMenu();
  }
}
