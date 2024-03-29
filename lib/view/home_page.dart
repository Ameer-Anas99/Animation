import 'package:animation/model/model.dart';
import 'package:animation/widget/apptext.dart';
import 'package:animation/widget/details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Activity> activities = [];
  List<Widget> activitiesList = [];
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    // _addactivity();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addactivity();
    });
  }

  void _addactivity() {
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

    Future ftr = Future(() {});
    _activities.forEach((Activity activity) {
      ftr = ftr.then((value) {
        return Future.delayed(Duration(milliseconds: 700), () {
          activitiesList.add(buildCard(activity));
          _listKey.currentState!.insertItem(activitiesList.length - 1);
        });
      });
    });
  }

  Tween<Offset> _offest = Tween(begin: Offset(1, 0), end: Offset(0, 0));

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
              curve: Curves.bounceOut,
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
            // Flexible(
            //   child: ListView.builder(
            //     itemCount: activities.length,
            //     itemBuilder: (context, index) {
            //       Activity activity = activities[index];
            //       return buildCard(activity);
            //     },
            //   ),
            // )
            // Flexible(
            //   child: AnimatedList(
            //      key: _listKey,
            //      initialItemCount: activitiesList.length,
            //     itemBuilder: (context, index, animation) {
            //       return SlideTransition(
            //         position: );
            //     },))
            Flexible(
              // child: ListView.builder(
              //   itemCount: activitiesList.length,
              //   itemBuilder: (context, index) {
              //     return activitiesList[index];
              //   },
              // ),
              child: AnimatedList(
                key: _listKey,
                initialItemCount: activitiesList.length,
                itemBuilder: (context, index, animation) {
                  return SlideTransition(
                    position: animation.drive(_offest),
                    child: activitiesList[index],
                  );
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
