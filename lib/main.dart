import 'package:flutter/material.dart';
import 'package:flutter_application/home_sceen.dart';
import 'package:flutter_application/screen_two.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: HomeSceen.id,
    theme: ThemeData(primarySwatch: Colors.purple),
    debugShowCheckedModeBanner: false,
    routes: {
      HomeSceen.id: (context) => const HomeSceen(),
      ScreenTwo.id: (context) => const ScreenTwo(),
    },
    home: const HomeSceen(),
    title: "Flutter Application",
  ));
}
