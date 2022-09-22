// ignore: file_names
import 'package:flutter/material.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({Key? key}) : super(key: key);

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              transform: Matrix4.rotationX(.5),
              width: 270,
              height: 330,
              // padding: const EdgeInsets.only(
              //     left: 20, right: 80, bottom: 90, top: 76),
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              margin: const EdgeInsets.only(left: 70),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(30)),
                border: Border.all(color: Colors.black87, width: 2),
                color: Colors.red,
                boxShadow: const [
                  BoxShadow(color: Colors.green, blurRadius: 50),
                ],
                image: const DecorationImage(
                    image: AssetImage("Assets/logo.png"), fit: BoxFit.cover),
              ),

              child: const Center(
                  child: Text("hhhh",
                      style: TextStyle(fontSize: 30, color: Colors.white70))),
            ),
          ),
        ],
      ),
    );
  }
}
