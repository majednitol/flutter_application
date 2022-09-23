import 'package:flutter/material.dart';

class CircleAvtarWidget extends StatelessWidget {
  const CircleAvtarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CircleAvatar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(height: 60),
          Divider(
            color: Colors.black,
            thickness: 2,
          ),
          SizedBox(
              height: 30,
              child: VerticalDivider(
                color: Colors.black,
              )),
          CircleAvatar(
            radius: 100,
            backgroundColor: Colors.black,
            backgroundImage: AssetImage("Assets/logo.png"),
            child: Icon(Icons.person),
          )
        ],
      ),
    );
  }
}
