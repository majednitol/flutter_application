import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application/Model/PostsModel.dart';
import 'package:http/http.dart' as http;

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  List<PostsModel> postList = [];
  Future<List<PostsModel>> getPostList() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      postList.clear();
      for (Map i in data) {
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Get Api'),
        ),
        body: FutureBuilder(
            future: getPostList(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.red,
                ));
              } else {
                return ListView.builder(
                  itemCount: postList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("title",
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                            Text(postList[index].title.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            const SizedBox(
                              height: 3,
                            ),
                            const Text("body",
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                            Text(postList[index].body.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }));
  }
}
