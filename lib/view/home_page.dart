import 'package:animation/model/model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Activity> activities = [];
  @override
  void initState() {
    activities = [
      Activity(
          name: "unknow", location: "kerala,india", imageUrl: "", price: 150)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home Page")),
      ),
      backgroundColor: const Color.fromARGB(255, 68, 118, 143),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Pick Your \nFavorite Activity ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
