import 'package:flutter/material.dart';
class AnimatedOpacityScreen extends StatefulWidget {
  const AnimatedOpacityScreen({super.key});

  @override
  State<AnimatedOpacityScreen> createState() => _AnimatedOpacityScreenState();
}

class _AnimatedOpacityScreenState extends State<AnimatedOpacityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Container(
            color: Colors.cyan,
            child:AnimatedOpacity(
              duration:Duration(seconds: 10),
              opacity: 0,
                child: Text("Animated Opacity",style: TextStyle(
                  color: Colors.black
                ),))
          ),
        ),
      )
    );
  }
}
