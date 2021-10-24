import 'package:flutter/material.dart';

// CONSTANTS AND DATA

List<Event> items = [
  Event.withParams("HackGT8", "Yes", true, true, 1.0),
  Event.withParams("VSA moon festival", "Yes", true, true, 1.0),
  Event.withParams("Shirts at Exhibition Hall", "Yes", false, true, 1.0),
  Event.nameOnly("CoC lunch"),
  Event.withParams("Small pumpkin event", "Yes", false, true, 0.0),
];

List<User> users = [
  User.allParams("Amanda", 10),
  User.allParams("Joe", 700),
  User.allParams("Wei Xiong", 50),
  User.allParams("Devaughn", 800),
  User.allParams("KT", 1000)
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
