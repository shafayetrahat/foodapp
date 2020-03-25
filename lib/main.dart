import 'package:flutter/material.dart';
import 'package:foodapp/views/dashboard.dart';
import 'package:foodapp/views/home.dart';
import 'views/cart.dart';
import 'package:foodapp/services/authservice.dart';


void main() =>runApp(FoodApp());

class FoodApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthService().handleAuth(),
      routes: {
        '/cart': (BuildContext context) => Cart(),
        '/home': (BuildContext context) => HomePage(),
        '/dashboard': (BuildContext context) => Dasboard(),
      },
    );
  }
}

