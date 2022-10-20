import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Ui/posts/add_post.dart';
import 'package:flutter_application/Ui/utils.dart';

import '../auth/login_screen.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  final databaseref = FirebaseDatabase.instance.ref("post");
  final _auth = FirebaseAuth.instance;
  final searchFilter = TextEditingController();
  final textedit = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Post page'),
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut().then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                }).onError((error, stackTrace) {
                  Utils().toast(error.toString());
                });
              },
              icon: const Icon(Icons.logout_outlined)),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddPost()))
            }),
        child: const Icon(Icons.add),
      ),
      body: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            controller: searchFilter,
            onChanged: ((value) {
              setState(() {});
            }),
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "Search something"),
          ),
        ),

        Expanded(
          child: FirebaseAnimatedList(
            query: databaseref,
            defaultChild: const Center(child: CircularProgressIndicator()),
            itemBuilder: (context, snapshot, animation, index) {
              final title = snapshot.child("title").value.toString();
              final id = snapshot.child("id").value.toString();

              if (searchFilter.text.isEmpty) {
                return ListTile(
                  title: Text(snapshot.child("title").value.toString()),
                  subtitle: Text(snapshot.child("id").value.toString()),
                  trailing: PopupMenuButton(
                      icon: const Icon(Icons.more_vert),
                      itemBuilder: (context) => [
                            PopupMenuItem(
                                value: 1,
                                child: ListTile(
                                  onTap: (() {
                                    Navigator.pop(context);
                                    showMyDialog(title, id);
                                  }),
                                  trailing: const Icon(Icons.edit),
                                  title: const Text("Edit"),
                                )),
                            PopupMenuItem(
                                value: 1,
                                child: ListTile(
                                  onTap: (() {
                                    Navigator.pop(context);
                                    databaseref.child(id).remove();
                                  }),
                                  trailing: const Icon(Icons.delete),
                                  title: const Text("Delete"),
                                ))
                          ]),
                );
              } else if (title
                  .toLowerCase()
                  .contains(searchFilter.text.toLowerCase())) {
                return ListTile(
                  title: Text(snapshot.child("title").value.toString()),
                  subtitle: Text(snapshot.child("id").value.toString()),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
        // Expanded(
        //   child: StreamBuilder(
        //     stream: databaseref.onValue,
        //     builder:
        //         (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
        //       if (!snapshot.hasData) {
        //         return const Center(child: CircularProgressIndicator());
        //       } else {
        //         Map<dynamic, dynamic> map =
        //             snapshot.data!.snapshot.value as dynamic;
        //         List<dynamic> list = [];
        //         list.clear();
        //         list = map.values.toList();
        //         // return ListView.builder(
        //         //   itemCount: snapshot.data!.snapshot.children.length,
        //         //   itemBuilder: (BuildContext context, int index) {
        //         //     final title = list[index]['title'].toString();
        //         //     final id = list[index]['id'].toString();
        //         //     if (searchFilter.text.isEmpty) {
        //         //       return ListTile(
        //         //         title: Text(list[index]['title'].toString()),
        //         //         subtitle: Text(list[index]['id'].toString()),
        //         //         trailing: PopupMenuButton(
        //         //             icon: const Icon(Icons.more_vert),
        //         //             itemBuilder: (context) => [
        //         //                   PopupMenuItem(
        //         //                       value: 1,
        //         //                       child: ListTile(
        //         //                         onTap: (() {
        //         //                           Navigator.pop(context);
        //         //                           showMyDialog(title, id);
        //         //                         }),
        //         //                         trailing: const Icon(Icons.edit),
        //         //                         title: const Text("Edit"),
        //         //                       )),
        //         //                   PopupMenuItem(
        //         //                       value: 1,
        //         //                       child: ListTile(
        //         //                         onTap: (() {
        //         //                           Navigator.pop(context);
        //         //                           databaseref.child(id).remove();
        //         //                         }),
        //         //                         trailing: const Icon(Icons.delete),
        //         //                         title: const Text("Delete"),
        //         //                       ))
        //         //                 ]),
        //         //       );
        //         //     } else if (title
        //         //         .toLowerCase()
        //         //         .contains(searchFilter.text.toLowerCase())) {
        //         //       return ListTile(
        //         //         title: Text(list[index]['title'].toString()),
        //         //         subtitle: Text(list[index]['id'].toString()),
        //         //       );
        //         //     } else {
        //         //       return Container();
        //         //     }
        //         //   },
        //         // );
        //       }
        //     },
        //   ),
        // ),
      ]),
    );
  }

  Future<void> showMyDialog(String title, String id) async {
    textedit.text = title;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Update"),
            content: Container(
              child: TextField(
                controller: textedit,
              ),
            ),
            actions: [
              TextButton(
                onPressed: (() {
                  Navigator.pop(context);
                }),
                child: const Text("Delete"),
              ),
              TextButton(
                onPressed: (() {
                  Navigator.pop(context);
                  databaseref.child(id).update(
                      {'title': textedit.text.toString()}).then((value) {
                    Utils().toast("Update successfully");
                  }).onError((error, stackTrace) {
                    Utils().toast(error);
                  });
                }),
                child: const Text("Update"),
              )
            ],
          );
        });
  }
}
