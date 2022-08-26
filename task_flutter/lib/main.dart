import 'package:flutter/material.dart';
import 'package:task_flutter/pages/home.dart';
import 'package:task_flutter/pages/main_screen.dart';
import 'package:task_flutter/pages/weather.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
      primarySwatch: Colors.deepOrange
  ),
  initialRoute: "/",
  routes: {
    "/": (context) => const MainScreen(),
    "/todo": (context) => const Home(),
    "/weather": (context) => const WeatherPage(),
  },
));
