import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  List<Photos> photoList = [];
  Future<List<Photos>> getPhotos() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var dat = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in dat) {
        Photos photos = Photos(title: i["title"], url: i["url"], id: i["id"]);
        photoList.add(photos);
      }
      return photoList;
    } else {
      return photoList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: Column(
          children: [
            Expanded(
                child: FutureBuilder(
                    future: getPhotos(),
                    builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return ListView.builder(
                          itemCount: photoList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    snapshot.data![index].url.toString()),
                              ),
                              subtitle:
                                  Text(snapshot.data![index].title.toString()),
                              title: Text(snapshot.data![index].id.toString()),
                            );
                          },
                        );
                      }
                    }))
          ],
        ));
  }
}

class Photos {
  String title, url;
  int id;
  Photos({required this.title, required this.url, required this.id});
}
