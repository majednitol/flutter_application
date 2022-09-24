import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Flutter Application",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.teal),
    home: const HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WhatsApp UI'),
          bottom: const TabBar(tabs: [
            Tab(child: Icon(Icons.camera_alt_sharp)),
            Tab(child: Text("Chat")),
            Tab(child: Text("Call")),
            Tab(child: Text("Status")),
          ]),
          actions: [
            const Icon(Icons.search),
            const SizedBox(
              width: 20,
            ),
            PopupMenuButton(
                itemBuilder: (
              context,
            ) =>
                    [
                      const PopupMenuItem(
                        value: "1",
                        child: Text("New group"),
                      ),
                      const PopupMenuItem(
                        value: "2",
                        child: Text("New group"),
                      ),
                      const PopupMenuItem(
                        value: "3",
                        child: Text("New group"),
                      )
                    ])
          ],
        ),
        body: TabBarView(children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const ListTile(
                  leading: Image(image: AssetImage("Assets/logo.png")),
                  title: Text("Majed nitol"),
                  subtitle: Text("You viewed day"),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const ListTile(
                  leading: Image(image: AssetImage("Assets/logo.png")),
                  title: Text("Majed nitol"),
                  subtitle: Text("it's good for you"),
                  trailing: Text("3:23 AM"),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    leading: const Image(image: AssetImage("Assets/logo.png")),
                    title: const Text("Majed nitol"),
                    subtitle: Text(index / 2 == 0
                        ? "you missed audio"
                        : "you missed video"),
                    trailing:
                        Icon(index / 2 == 0 ? Icons.phone : Icons.video_call));
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const ListTile(
                  leading: Image(image: AssetImage("Assets/logo.png")),
                  title: Text("Majed nitol"),
                  subtitle: Text("hi"),
                  trailing: Text("3:23 PM"),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
