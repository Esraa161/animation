import 'package:animation/AnimatedClipPath_Screen.dart';
import 'package:animation/AnimatedCrossFade_widget.dart';
import 'package:animation/AnimatedList_widget.dart';
import 'package:animation/animatedOpacity.dart';
import 'package:flutter/material.dart';
import 'animated_container.dart';
void main() {
  runApp( MyApp());
}
class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:AnimatedClipPathScreen(),
    );

  }
}
