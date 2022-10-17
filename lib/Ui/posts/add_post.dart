import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Ui/utils.dart';

import '../Widget/rounded_button.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  final databaseRef = FirebaseDatabase.instance.ref("post");
  bool isLoading = false;
  TextEditingController inputTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add post page'),
      ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              maxLines: 4,
              controller: inputTextController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "What about you think ? "),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          RoundedButton(
            isLoading: isLoading,
            title: "submit",
            onTap: (() {
              setState(() {
                isLoading = true;
              });
              databaseRef
                  .child(id)
                  .set({
                "title": inputTextController.text.toString(),
                "id": id
              }).then((value) {
                setState(() {
                  Utils().toast("data successfully uploaded");
                  isLoading = false;
                });
              }).onError((error, stackTrace) {
                setState(() {
                  isLoading = false;
                });
                Utils().toast(error.toString());
              });
            }),
          ),
        ],
      ),
    );
  }
}
