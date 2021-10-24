import 'package:flutter/material.dart';

// CONSTANTS

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

TextStyle biggerFont = const TextStyle(fontSize: 18.0);

// CLASSES AND STRUCTURES
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
