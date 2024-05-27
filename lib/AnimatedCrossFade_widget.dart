import 'package:flutter/material.dart';
class AnimatedCrossFadeWidgetScreen extends StatefulWidget {
  const AnimatedCrossFadeWidgetScreen({super.key});

  @override
  State<AnimatedCrossFadeWidgetScreen> createState() => _AnimatedCrossFadeWidgetScreenState();
}

class _AnimatedCrossFadeWidgetScreenState extends State<AnimatedCrossFadeWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(16),
                      color: Colors.cyan,
                      child:Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("..........>>"),
                            SizedBox(width: 16,),
                            AnimatedCrossFade(
                                duration:Duration(seconds: 1),
                                firstChild: SizedBox(),
                                secondChild:Text("hellow wwww") ,
                                crossFadeState:CrossFadeState.showSecond ,
      
                               ),
                          ],
                        ),
                      )
                  ),
                  Container(
                    height: 200,
                      width: double.infinity,
                      margin: EdgeInsets.all(16),
                      color: Colors.green,
                      child:Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("..........>>"),
                            SizedBox(width: 16,),
                            AnimatedCrossFade(
                              duration:Duration(seconds: 1),
                              firstChild: SizedBox(),
                              secondChild:Text("hellow wwww") ,
                              crossFadeState:CrossFadeState.showSecond ,
      
                            ),
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
