import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Loteray App",
    home: const LotteryApp(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.red),
  ));
}

class LotteryApp extends StatefulWidget {
  const LotteryApp({super.key});

  @override
  State<LotteryApp> createState() => _LotteryAppState();
}

class _LotteryAppState extends State<LotteryApp> {
  Random random = Random();
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'LotteryApp',
          style: TextStyle(fontFamily: 'Pacifico'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Lottery winning number is 4",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 270,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber[50],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: x == 4
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.done_all_outlined,
                              color: Colors.green,
                              size: 35,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "congratulation you have won the lottery!",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 35,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Better luck next time your number is $x. \ntry again",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          x = random.nextInt(10);
          setState(() {});
        }),
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }
}
