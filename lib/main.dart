import 'package:flutter/material.dart';
import 'package:flutter_application/stack_widget.dart';

void main() {
  runApp(MaterialApp(
    title: "Top ten widget",
    home: const StackWidget(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.red),
  ));
}
