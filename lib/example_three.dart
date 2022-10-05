import 'dart:convert';

import 'package:flutter/material.dart';

import 'Model/UserModel.dart';
import 'package:http/http.dart' as http;

class EXampleThree extends StatefulWidget {
  const EXampleThree({super.key});

  @override
  State<EXampleThree> createState() => _EXampleThreeState();
}

List<UserModel> userList = [];
Future<List<UserModel>> getUser() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map i in data) {
      userList.add(UserModel.fromJson(i));
    }
    return userList;
  } else {
    return userList;
  }
}

class _EXampleThreeState extends State<EXampleThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('getApi'),
        ),
        body: FutureBuilder(
          future: getUser(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("name :",
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              Text(userList[index].name.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("email :",
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              Text(userList[index].email.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Lat",
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              Text(userList[index].address!.geo!.lat.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
