import 'package:animation/model/model.dart';
import 'package:flutter/material.dart';

class ActivityProvider extends ChangeNotifier {
  List<Activity> _activities = [
    Activity(
        name: "Mount Fuji",
        location: "Mount Fuji, Japan",
        imageUrl: "asset/mount fuji japan.jpg",
        price: 150),
    Activity(
        name: "Rome",
        location: "Rome,Italy",
        imageUrl: "asset/rome,italy.png",
        price: 200),
    Activity(
        name: "Santorini",
        location: "Santorini,Greece",
        imageUrl: "asset/santorini,greece.jpg",
        price: 250),
  ];
  List<Activity> get activities => _activities;

  void addActivity(Activity activity) {
    _activities.add(activity);
    notifyListeners();
  }
}
