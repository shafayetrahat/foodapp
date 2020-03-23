import 'package:flutter/material.dart';
import 'views/signup.dart';
import 'views/settings.dart';
import 'views/home.dart';
void main() {
  runApp(FoodApp());
}

class FoodApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery System',
      initialRoute: '/signup',
      home: HomePage(),
      routes: {
        '/signup': (context) => Signup(),
        '/settings': (context) => Settings(),
        '/home': (context) => HomePage(),

      },
    );
  }
}

