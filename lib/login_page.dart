// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application/admin.dart';
import 'package:flutter_application/student.dart';
import 'package:flutter_application/teacher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formdata = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  String user = "select one";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LoginPage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: "Email"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: "Password"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "age"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("UserType"),
                Text(user),
                const SizedBox(
                  width: 30,
                )
              ],
            ),
          ),
          DropdownButton(
              items: const [
                DropdownMenuItem(value: "Admin", child: Text("Admin")),
                DropdownMenuItem(value: "Teacher", child: Text("Teacher")),
                DropdownMenuItem(value: "Student", child: Text("Student"))
              ],
              onChanged: ((value) {
                setState(() {
                  user = value.toString();
                });
              })),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: (() async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString("email", emailController.text.toString());
                sp.setString("password", passwordController.text.toString());
                sp.setString("age", ageController.text.toString());
                sp.setString("userType", user.toString());
                sp.setBool("isLogin", true);

                String userType = sp.getString("userType") ?? "";

                if (userType == 'Admin') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Admin(),
                      ));
                } else if (userType == 'Student') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Student(),
                      ));
                } else if (userType == 'Teacher') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Teacher(),
                      ));
                }

                //   sp.setString("name", "majedur");
                //   sp.setInt("age", 20);
                //   print(sp.getString("name"));
                //   sp.remove("name");
                //   print(sp.getString("name"));
                //   print(sp.getInt("age"));
                //   sp.clear();
                //   print(sp.getString("name"));
                //   print(sp.getInt("age"));
              }),
              child: Container(
                color: Colors.red,
                height: 50,
                width: double.infinity,
                child: const Center(child: Text("login")),
              ),
            ),
          )
        ],
      ),
    );
  }
}
