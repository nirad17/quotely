import 'package:flutter/material.dart';

import 'package:quotely/screens/home.dart';

import 'screens/favourites.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      title: 'Quotes App',
      home: HomeScreen(),
      routes: {
        '/home' : (context) => HomeScreen(),
        '/favourites': (context) => FavouriteScreen(),
      },
    );
  }
}