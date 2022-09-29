import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';
class Teacher extends StatefulWidget {
  const Teacher({super.key});

  @override
  State<Teacher> createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  String email = '';
  String password = '';
  String age = '';
  String userType = '';
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString("email") ?? "";
    password = sp.getString("password") ?? "";
    age = sp.getString("age") ?? "";
    userType = sp.getString("userType") ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('Email'),
            Text(
              email.toString(),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('Password'),
            Text(
              password.toString(),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('Age'),
            Text(
              age.toString(),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('UserType'),
            Text(
              userType.toString(),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: InkWell(
              onTap: (() async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.clear();

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              }),
              child: Center(
                child: Container(
                    color: Colors.red,
                    height: 50,
                    width: double.infinity,
                    child: const Center(child: Text("logout"))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}