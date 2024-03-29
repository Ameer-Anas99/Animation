import 'package:animation/controller/activity_provider.dart';
import 'package:animation/model/model.dart';
import 'package:animation/widget/apptext.dart';
import 'package:animation/widget/details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedListWidget extends StatefulWidget {
  @override
  _AnimatedListWidgetState createState() => _AnimatedListWidgetState();
}

class _AnimatedListWidgetState extends State<AnimatedListWidget> {
  late GlobalKey<AnimatedListState> _listKey;
  late Tween<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _listKey = GlobalKey<AnimatedListState>();
    _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _addActivityItems();
    });
  }

  // void _addActivityItems() {
  //   final activityProvider =
  //       Provider.of<ActivityProvider>(context, listen: false);
  //   Future.delayed(Duration(milliseconds: 700), () {
  //     for (int i = 0; i < activityProvider.activities.length; i++) {
  //       _listKey.currentState!.insertItem(i);
  //     }
  //   });
  // }
  void _addActivityItems() {
    final activityProvider =
        Provider.of<ActivityProvider>(context, listen: false);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      for (int i = 0; i < activityProvider.activities.length; i++) {
        _listKey.currentState!
            .insertItem(i, duration: Duration(milliseconds: 500));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final activityProvider = Provider.of<ActivityProvider>(context);
    return AnimatedList(
      key: _listKey,
      initialItemCount: activityProvider.activities.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: animation.drive(_offset),
          child: buildCard(activityProvider.activities[index]),
        );
      },
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
                    builder: (context) => Details(activity: activity)),
              );
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
