import 'package:animation/model/model.dart';
import 'package:animation/widget/fav_icon.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Activity? activity;
  const Details({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              child: Image.asset(
                "${activity!.imageUrl}",
                height: 400,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              title: Text(
                activity!.name,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.grey),
              ),
              subtitle: Text(
                '\$${activity!.price} Only',
                style: TextStyle(
                  letterSpacing: 1,
                ),
              ),
              trailing: FavoriteButton(),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text("explain this ......"),
            )
          ],
        ),
      ),
    );
  }
}
