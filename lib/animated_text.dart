import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({Key? key}) : super(key: key);

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('AnimatedText'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // fade animation
          Center(
            child: AnimatedTextKit(
              animatedTexts: [
                FadeAnimatedText(
                  "hello world",
                )
              ],
              totalRepeatCount: 10,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          // rotate the text
          Center(
            child: AnimatedTextKit(
              animatedTexts: [
                RotateAnimatedText(
                  "hello world",
                )
              ],
              totalRepeatCount: 10,
            ),
          ),
          // typerAnimatedText
          SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'Bobbers',
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText('It is not enough to do your best,'),
                  TyperAnimatedText('you must know what to do,'),
                  TyperAnimatedText('and then do your best'),
                  TyperAnimatedText('- W.Edwards Deming'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
          // TypewriterAnimatedText
          SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'Agne',
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText('Discipline is the best tool'),
                  TypewriterAnimatedText('Design first, then code'),
                  TypewriterAnimatedText('Do not patch bugs out, rewrite them'),
                  TypewriterAnimatedText(
                      'Do not test bugs out, design them out'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
          // ScaleAnimatedText
          SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 70.0,
                fontFamily: 'Canterbury',
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  ScaleAnimatedText('Think'),
                  ScaleAnimatedText('Build'),
                  ScaleAnimatedText('Ship'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
          // wavyAnimatedText
          SizedBox(
            width: 250.0,
            child: TextLiquidFill(
              text: 'LIQUIDY',
              waveColor: Colors.blueAccent,
              boxBackgroundColor: Colors.redAccent,
              textStyle: const TextStyle(
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
              ),
              boxHeight: 300.0,
            ),
          ),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 20.0,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('Hello World'),
                WavyAnimatedText('Look at the waves'),
              ],
              isRepeatingAnimation: true,
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
          // FlickerAnimatedText
          SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 35,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 7.0,
                    color: Colors.white,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  FlickerAnimatedText('Flicker Frenzy'),
                  FlickerAnimatedText('Night Vibes On'),
                  FlickerAnimatedText("C'est La Vie !"),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
