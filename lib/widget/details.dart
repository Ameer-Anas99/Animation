import 'package:animation/model/model.dart';
import 'package:animation/widget/fav_icon.dart';
import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

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
      extendBodyBehindAppBar: true,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'activity-img-${activity!.imageUrl}',
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
                      color: Color.fromARGB(255, 22, 126, 178)),
                ),
                subtitle: Text(
                  '\$${activity!.price} Only',
                  style: TextStyle(letterSpacing: 1, fontSize: 15),
                ),
                trailing: FavButton(),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  loremIpsum(words: 100, paragraphs: 4, initWithLorem: true),
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 99, 96, 96)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
