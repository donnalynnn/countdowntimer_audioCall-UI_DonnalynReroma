import 'dart:async';

import 'package:countdown_timer/size_config.dart';
import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({Key? key}) : super(key: key);

  @override
  State<CountDownTimer> createState() => CountDownTimerState();
}

class CountDownTimerState extends State<CountDownTimer> {
  // Step 2
  Timer? countdownTimer;
  Duration myDuration = const Duration(days: 5);
  @override
  void initState() {
    super.initState();
  }

  /// Timer related methods ///
  // Step 3
  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(days: 5));
  }

  // Step 6
  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  Widget buildButtons() {
    final isRunning = countdownTimer == null ? false : countdownTimer!.isActive;

    return isRunning
        ? SizedBox.fromSize(
            size: const Size(64, 64),
            child: ClipOval(
              child: Material(
                color: const Color.fromARGB(255, 233, 56, 56),
                child: InkWell(
                  splashColor: Colors.red[900],
                  onTap: () {
                    resetTimer();
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.call_end_rounded, color: Colors.white)
                    ],
                  ),
                ),
              ),
            ),
          )
        : SizedBox.fromSize(
            size: const Size(64, 64),
            child: ClipOval(
              child: Material(
                color: Colors.lightGreen[800],
                child: InkWell(
                  splashColor: const Color.fromARGB(255, 54, 90, 28),
                  onTap: () {
                    startTimer();
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Icon(Icons.call, color: Colors.white)],
                  ),
                ),
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    String setText() {
      final isRunning = countdownTimer == null ? false : countdownTimer!.isActive;

      return isRunning? 'call ends in 00:$seconds'.toUpperCase()
      : 'incoming call'.toUpperCase();
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        //img
        Image.asset(
          'assets/images/orange_cat.jpg',
          fit: BoxFit.cover,
        ),
        //black layer
        DecoratedBox(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.5))),

        Padding(
          padding: const EdgeInsets.all(35.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Orange \nCat',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: Colors.white),
                ),
                const VerticalSpacing(
                  of: 10,
                ),
                Text(
                  setText(),
                  style: const TextStyle(color: Colors.white60),
                ),
                const Spacer(),
                Center(
                  child: buildButtons(),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
