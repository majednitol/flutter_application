

import 'package:flutter/material.dart';
import 'package:flutter_application/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    title: "Flutter Application",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.purple),
    home: const SplashScreen(),
  ));
}
