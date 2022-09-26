import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class Readmore extends StatefulWidget {
  const Readmore({Key? key}) : super(key: key);

  @override
  _ReadmoreState createState() => _ReadmoreState();
}

class _ReadmoreState extends State<Readmore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Readmore'),
      ),
      body: Column(
        children: const [
          ReadMoreText(
            "lorem ipsum dolor sit ametAmet deserunt qui minim dolore do nostrud commodo dolor nisi eu proident voluptate ad aliquip. Amet mollit aliqua proident cillum tempor sit in. Reprehenderit ipsum aliquip cillum enim ullamco. Nostrud excepteur nulla est aliquip laboris ad ad. Occaecat exercitation occaecat tempor sunt aute ipsum nostrud.",
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimCollapsedText: "show more",
            trimExpandedText: "show less",
            moreStyle: TextStyle(color: Colors.amber),
            lessStyle: TextStyle(color: Colors.blue),
            style: TextStyle(color: Colors.green),
          )
        ],
      ),
    );
  }
}
