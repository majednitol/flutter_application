import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'json Serialation and Deserialization/user_Model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: "firebase siries",
    home: const Main(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.amber),
  ));
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  UserModel userobject =
      UserModel(id: "002", fullname: "John", email: " xyz@example.com");
  String userJson =
      '{"id": "0011", "fullname": "John", "email": " xyz@example.com"}';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (() {
                  Map<String, dynamic> usermap = userobject.toMap();
                  var json = jsonEncode(usermap);
                  print(json.toString());
                }),
                child: const Text("serialize")),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
                onPressed: (() {
                  var decoded = jsonDecode(userJson);
                  Map<String, dynamic> userMap = decoded;
                  UserModel newUser = UserModel.fromMap(userMap);
                  print(newUser.email.toString());
                }),
                child: const Text("Deserialize")),
          ],
        ),
      ),
    );
  }
}
