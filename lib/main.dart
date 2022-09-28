// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application/login_page.dart';
import 'package:flutter_application/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    title: "Flutter Application",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.purple),
    home: const SplashScreen(),
  ));
}


