import 'package:flutter/material.dart';
import 'package:flutter_application/listTile_Widget.dart';
import 'package:flutter_application/stack_widget.dart';
import 'package:flutter_application/textFormFieldWidget.dart';

import 'circleAvtar_widget.dart';

void main() {
  runApp(MaterialApp(
    title: "Top ten widget",
    home: const ListTileWidget(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.red),
  ));
}
