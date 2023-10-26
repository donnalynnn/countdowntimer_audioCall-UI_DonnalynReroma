import 'package:flutter/material.dart';
import 'screens/audioCall/audio_call.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'SF UI',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AudioCall(),
    );
  }
}