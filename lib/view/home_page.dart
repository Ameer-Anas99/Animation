import 'package:animation/controller/activity_provider.dart';
import 'package:animation/view/animated_list.dart';
import 'package:animation/widget/apptext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final activityProvider = Provider.of<ActivityProvider>(context);
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
            // Flexible(
            // child: ListView.builder(
            //   itemCount: activitiesList.length,
            //   itemBuilder: (context, index) {
            //     return activitiesList[index];
            //   },
            // ),
            //   child: AnimatedList(
            //     key: _listKey,
            //     initialItemCount: activitiesList.length,
            //     itemBuilder: (context, index, animation) {
            //       return SlideTransition(
            //         position: animation.drive(_offest),
            //         child: activitiesList[index],
            //       );
            //     },
            //   ),
            // ),
            Flexible(child: AnimatedListWidget())
          ],
        ),
      ),
    );
  }
}
