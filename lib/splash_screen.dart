import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application/admin.dart';
import 'package:flutter_application/login_page.dart';
import 'package:flutter_application/student.dart';
import 'package:flutter_application/teacher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool("isLogin") ?? false;
    String userType = sp.getString("userType") ?? "";

    if (isLogin) {
      if (userType == 'Admin') {
        Timer(const Duration(seconds: 5), (() {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Admin(),
              ));
        }));
      } else if (userType == 'Teacher') {
        Timer(const Duration(seconds: 5), (() {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Teacher(),
              ));
        }));
      } else if (userType == 'Student') {
        Timer(const Duration(seconds: 5), (() {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Student(),
              ));
        }));
      }
    } else {
      Timer(const Duration(seconds: 5), (() {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ));
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
          height: double.infinity,
          fit: BoxFit.fitHeight,
          image: AssetImage("Assets/k.jpg")),
    );
  }
}
