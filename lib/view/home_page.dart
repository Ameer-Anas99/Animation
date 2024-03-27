import 'package:animation/model/model.dart';
import 'package:animation/widget/apptext.dart';
import 'package:animation/widget/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          price: 250)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 68, 118, 143),
      body: Container(
        padding: EdgeInsets.only(left: 22, right: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(seconds: 2),
              builder: (BuildContext context, double val, Widget? child) {
                return Opacity(
                  opacity: val,
                  child: Padding(
                    padding: EdgeInsets.only(top: val * 80),
                    child: child,
                  ),
                );
              },
              child: AppText(
                data: "Pick Your \nFavorite Activity ",
                color: Colors.white,
                size: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  Activity activity = activities[index];
                  return buildCard(activity);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Card buildCard(Activity activity) {
    return Card(
      color: Colors.white,
      child: SizedBox(
        height: 100,
        child: Center(
          child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Details(activity: activity)));
            },
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: 'activity-img-${activity.imageUrl}',
                child: Image.asset(
                  activity.imageUrl,
                  height: 100,
                ),
              ),
            ),
            trailing: AppText(
              data: activity.price.toString(),
              size: 18,
            ),
            title: AppText(
              data: activity.name,
              size: 20,
            ),
            subtitle: AppText(
              data: activity.location,
              size: 16,
              color: Color.fromARGB(255, 74, 73, 73),
            ),
          ),
        ),
      ),
    );
  }
}
