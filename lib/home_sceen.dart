import 'package:flutter/material.dart';
import 'package:flutter_application/screen_two.dart';

class HomeSceen extends StatelessWidget {
  static const String id = "home-sceen";
  const HomeSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screen'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Md. Majedur Rahman"),
              accountEmail: Text("Majedur@example.com"),
              currentAccountPicture:
                  CircleAvatar(backgroundImage: AssetImage("Assets/logo.png")),
            ),
            ListTile(
              leading: const Icon(Icons.home_max_outlined),
              title: const Text("Home"),
              onTap: () {
                Navigator.pushNamed(context, HomeSceen.id);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calculate_outlined),
              title: const Text("Page2"),
              onTap: () {
                Navigator.pushNamed(context, ScreenTwo.id);
              },
            ),
            const ListTile(
              leading: Icon(Icons.logout_outlined),
              title: Text("Logout"),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: TextButton(
                  onPressed: (() {
                    Navigator.pushNamed(context, ScreenTwo.id);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const ScreenTwo()));
                  }),
                  child: const Text("Screen one")))
        ],
      ),
    );
  }
}
