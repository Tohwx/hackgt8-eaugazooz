import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// Overall notes on flutter
// Almost everything is a widget, including alignment, padding, and layout.

// The Scaffold widget provides a default app bar
// and a body property that holds the widget tree for the home screen.

// A widget’s main job is to provide a build() method that describes how to
// display the widget in terms of other, lower level widgets.

// The body for this example consists of a Center widget containing a Text
// child widget.

// => notation signifies single-line method behavior
// alternatively, runApp(const MyApp());
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // build method within StatelessWidget class
  // returns a Widget
  @override
  Widget build(BuildContext context) {
    // MaterialApp seems to be a widget
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

// by default, the name of a state class is prefixed with an underbar
// generic state class specialized for use with randomwords
// maintains state for the widget
// separate class for the actual state -- main class creates an instance
class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[]; // wordpair array
  final _saved = <WordPair>{}; // SET! doesn't allow duplicate entries
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          // i is iterator and begins at 0, increments twice
          // but where is it being incremented????? every time the function is called
          if (i.isOdd) return const Divider(); // add a divider for each row
          final index = i ~/
              2; // calculates number of actual word pairings minus dividers

          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
            // if reach the end of pairings, generate 10 more and add them to the list
          }
          return _buildRow(_suggestions[index]); // calls once per word pair
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
          semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Startup Name Generator')),
        ),
        body: _buildSuggestions());
  }
}
