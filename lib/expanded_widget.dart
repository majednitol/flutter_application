import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpandedWidget'),
      ),
      body: Row(children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.red,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.green,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.purpleAccent,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: const Color.fromARGB(255, 243, 135, 33),
          ),
        )
      ]),
    );
  }
}
