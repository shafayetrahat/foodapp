import 'package:flutter/material.dart';
import 'views/settings.dart';
// import 'views/home.dart';
import 'package:foodapp/services/authservice.dart';
void main() =>runApp(FoodApp());

class FoodApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthService().handleAuth(),
      title: 'Food Delivery System',
      routes: {
        '/settings': (BuildContext context) => Settings(),
        // '/home': (BuildContext context) => HomePage(),
      },
    );
  }
}

