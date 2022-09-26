import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FontAwsome extends StatefulWidget {
  const FontAwsome({Key? key}) : super(key: key);

  @override
  _FontAwsomeState createState() => _FontAwsomeState();
}

class _FontAwsomeState extends State<FontAwsome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('font_awesome'),
      ),
      body: Column(
        children: const [Icon(FontAwesomeIcons.phone)],
      ),
    );
  }
}
