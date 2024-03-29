import 'package:animation/controller/activity_provider.dart';
import 'package:animation/view/home_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider(
            create: (context) => ActivityProvider(), child: HomePage()));
  }
}
