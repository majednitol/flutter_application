import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({Key? key}) : super(key: key);

  @override
  _ExampleOneState createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  void login(String email, String password) async {
    try {
      Response response =
          await post(Uri.parse("https://reqres.in/api/register"), body: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
       
        print("Account successfully created");
      } else {
       var data = jsonDecode(response.body.toString());
        print(data);
        print("Account failed to created");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login and Sign up Api'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: emailEditingController,
                decoration: const InputDecoration(hintText: "Email"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: passwordEditingController,
                decoration: const InputDecoration(hintText: "password"),
              ),
            ),
            GestureDetector(
              onTap: (() {
                login(emailEditingController.toString(),
                    passwordEditingController.toString());
              }),
              child: Container(
                height: 40,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: const Center(child: Text("Sign Up")),
              ),
            )
          ]),
    );
  }
}
