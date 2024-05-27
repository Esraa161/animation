import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class AnimatedClipPathScreen extends StatefulWidget {
  const AnimatedClipPathScreen({super.key});

  @override
  State<AnimatedClipPathScreen> createState() => _AnimatedClipPathScreenState();
}

class _AnimatedClipPathScreenState extends State<AnimatedClipPathScreen>
    with SingleTickerProviderStateMixin {
  final colors =[
    ColorModel(Colors.red.shade100,Alignment.center),
    ColorModel(Colors.cyan.shade100,Alignment.topLeft),
    ColorModel(Colors.pink.shade100,Alignment.bottomRight),
    ColorModel(Colors.green.shade100,Alignment.center),
    ColorModel(Colors.orange.shade100,Alignment.topLeft),
    ColorModel(Colors.deepPurple.shade100,Alignment.bottomRight),
    ColorModel(Colors.blue.shade100,Alignment.center),
    ColorModel(Colors.indigoAccent.shade100,Alignment.topLeft),

  ];
  late ColorModel currantColor;
  late ColorModel prevColor;
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prevColor=colors.first;
    currantColor=colors.first;
    animationController=AnimationController(vsync: this, duration: Duration(microseconds: 500));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }
  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height/1.5,
                  width: double.infinity,
                  color: prevColor.Colors,
                ),
                AnimatedBuilder(
                  animation: animationController,
                  builder: (context,_) {
                    return ClipPath(
                      clipper: CustomPath(animationController.value,currantColor.alignment),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height/1.5,
                        width: double.infinity,
                        color: currantColor.Colors,
                      ),
                    );
                  }
                ),
              ],
            ),

            Expanded(child:
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: colors.length,

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:4,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12
                  ),
                  itemBuilder:(context,index){

                  return GestureDetector(
                    onTap: (){

                      currantColor=colors[index!];
                      animationController.forward(from: 0.0).whenComplete((){
                        prevColor=currantColor;
                        setState(() {

                        });
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: colors[index]!.Colors,


                    ),
                  );
                  }),
            ))

          ],
        ),
      ),
    );
  }
}
class ColorModel{
  final  Color Colors;
  final Alignment alignment;
  ColorModel(this.Colors,this.alignment);

}
class CustomPath extends CustomClipper<Path>{
  final double value;
     final Alignment alignment;
  CustomPath(this.value,this.alignment);
  @override
  Path getClip(Size size) {
    Path path = Path();
    if(alignment==Alignment.topLeft){
      path.addOval(Rect.fromCenter(
          center:Offset(0,
              0),
          width: 200,
          height: 200));

    }else if(alignment==Alignment.center){
      path.addOval(Rect.fromCenter(
          center:Offset(size.width/2,
              size.height/2),
          width: 200,
          height: 200));


    }else{
      path.addOval(Rect.fromCenter(
          center:Offset(size.width,
              size.height),
          width: 200,
          height: 200));
    }

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
  
}