import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Ui/auth/login_screen.dart';
import 'package:flutter_application/Ui/posts/posts.dart';



class SplashServices {
  isLogin(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    
    if (user!=null) {
        Timer(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const Posts())));
    });
    }
    else{
      Timer(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const LoginScreen())));
    });
    }
    
  }
}
