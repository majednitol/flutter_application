import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListTile'),
      ),
      body: Column(
        children: [
          // const ListTile(
          //   leading: CircleAvatar(
          //     backgroundColor: Colors.black,
          //     backgroundImage: AssetImage("Assets/logo.png"),
          //   ),
          //   title: Text("Majed"),
          //   subtitle: Text("majed@gmail.com"),
          //   trailing: Text("3.26PM"),
          // ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                return const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage("Assets/logo.png"),
                  ),
                  title: Text("Majed"),
                  subtitle: Text("majed@gmail.com"),
                  trailing: Text("3.26PM"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
