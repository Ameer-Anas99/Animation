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
          name: "unknow",
          location: "kerala,india",
          imageUrl: "asset/ameer3.jpg",
          price: 150),
      Activity(
          name: "unknow",
          location: "mumbai,india",
          imageUrl: "asset/ameer5.jpg",
          price: 200),
      Activity(
          name: "unknow",
          location: "chennai,india",
          imageUrl: "asset/ameer10.jpg",
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
              duration: Duration(seconds: 3),
              builder: (BuildContext context, double val, Widget? child) {
                return Opacity(
                  opacity: val,
                  child: Padding(
                    padding: EdgeInsets.only(top: val * 40),
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
      child: Container(
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
              child: Image.asset(
                activity.imageUrl,
                height: 100,
              ),
            ),
            trailing: AppText(data: activity.price.toString()),
            title: Text(activity.name),
            subtitle: Text(activity.location),
          ),
        ),
      ),
    );
  }
}
