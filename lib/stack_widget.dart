import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StackWidget'),
      ),
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            width: 150,
            height: 200,
            color: Colors.red,
          ),
          Container(
            width: 150,
            height: 170,
            color: Colors.green,
          ),
          Container(
            width: 150,
            height: 130,
            color: Colors.blue,
          ),
          const Positioned(
            top: 20,
            left: 30,
            child: Text(" hello world"),
          )
        ],
      ),
    );
  }
}
