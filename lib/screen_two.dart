import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  static const String id = "screen-two";
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScreenTwo'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Center(
            //     child: TextButton(
            //         onPressed: (() {
            //           Navigator.pop(context);
            //         }),
            //         child: const Text("Screen two")))

            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return const ListTile(
                    leading: Image(image: AssetImage("Assets/logo.png")),
                    title: Text("Home"),
                    subtitle: Text("this is home"),
                    trailing: Icon(Icons.menu_book_outlined),
                  );
                },
              ),
            ),
          ]),
    );
  }
}
