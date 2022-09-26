import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class Badges extends StatefulWidget {
  const Badges({Key? key}) : super(key: key);

  @override
  _BadgesState createState() => _BadgesState();
}

class _BadgesState extends State<Badges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        actions: [
          Center(
            child: Badge(
              badgeContent: const Text("2"),
              badgeColor: Colors.teal,
              borderRadius: BorderRadius.circular(8),
              animationDuration: const Duration(milliseconds: 800),
              animationType: BadgeAnimationType.slide,
              child: const Icon(Icons.shopping_bag_outlined),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
        title: const Text('Badges'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Badge(
              shape: BadgeShape.square,
              animationDuration: const Duration(seconds: 3),
              borderRadius: BorderRadius.circular(8),
              badgeContent: const Text("message"),
            ),
          ),
        ],
      ),
    );
  }
}
