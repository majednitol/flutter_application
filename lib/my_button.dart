import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;
  const MyButton(
      {Key? key,
      required this.title,
      required this.onPress,
      this.color = const Color(0xffa5a5a5)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 80,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            child: Center(
                child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            )),
          ),
        ),
      ),
    );
  }
}
