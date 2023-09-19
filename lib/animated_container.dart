import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample>
    with SingleTickerProviderStateMixin{
  double _containerWidth = 100.0;
  double _containerHeight = 100.0;

  void _toggleContainerSize() {
    setState(() {
      _containerWidth = _containerWidth == 100.0 ? 180.0 : 100.0;
      _containerHeight = _containerHeight == 100.0 ? 180.0 : 100.0;
    });
  }
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Create an animation controller
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    // Create an animation using the controller
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Implicit Animation Example'),
      ),
      body: Center(
    child:
    AnimatedBuilder(
    animation: _animation,
    builder: (BuildContext context, Widget? child) {
      return Opacity(
        opacity: _animation.value,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                _toggleContainerSize();
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                width: _containerWidth,
                height: _containerHeight,
                color: Colors.teal,
                curve: Curves.easeInOut,
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Animated Container"),
                )),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation: 9,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: _toggleContainerSize,
              child: Text('Toggle Animation'),
            ),
          ],
        ),

      );
    }
      ),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_animationController.isCompleted) {
            _animationController.reverse();
          } else {
            _animationController.forward();
          }
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}