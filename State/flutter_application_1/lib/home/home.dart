import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 10;
  late Timer timer;
  bool isRunning = false;
  int count = 0;
  bool focusTime = true;

  void onTick(Timer t) {
    setState(() {
      totalSeconds = totalSeconds - 1;
      if (totalSeconds == 0 && focusTime == true) {
        focusTime = false;
        totalSeconds = 10;
      } else if (totalSeconds == 0 && focusTime == false) {
        countUpdate();
        focusTime = true;
        totalSeconds = 5;
      }
    });
  }

  void onStart() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    isRunning = true; //괄호 넣지 않기.괄호를 넣으면 바로 실행하는게 되어버림
  }

  void onPause() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void countUpdate() {
    setState(() {
      count = count + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                '$totalSeconds',
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 150,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: IconButton(
                color: Theme.of(context).cardColor,
                iconSize: 200,
                icon: Icon(isRunning
                    ? Icons.pause_circle_outline_outlined
                    : Icons.play_circle_outline_rounded),
                onPressed: isRunning ? onPause : onStart,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration:
                        BoxDecoration(color: Theme.of(context).cardColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoro',
                          style: TextStyle(
                              fontSize: 90,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color),
                        ),
                        Text(
                          '$count',
                          style: const TextStyle(fontSize: 60),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
