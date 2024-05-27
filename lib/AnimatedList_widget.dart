import 'package:flutter/material.dart';
class AnimatedListWidget extends StatefulWidget {
  const AnimatedListWidget({super.key});

  @override
  State<AnimatedListWidget> createState() => _AnimatedListWidgetState();
}

class _AnimatedListWidgetState extends State<AnimatedListWidget> {
  final List<String>items=[];
  final GlobalKey<AnimatedListState>key=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Column(
          children: [
            Expanded(
              child: AnimatedList(
                key: key,
                initialItemCount: items.length,
                itemBuilder:(context,index,animation) {
                  return SizeTransition(
                   // scale: animation,
                    sizeFactor:animation,
                    child: Card(
                      elevation: 5,

                      child: Container(
                        color: Colors.white,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.cyan.shade50,
                            child: Icon(Icons.ac_unit,
                              color: Colors.cyan,),
                          ),
                          title: Text(items[index]),
                          subtitle: Text("Sub Title"),
                          trailing: IconButton(
                            onPressed: (){
                              // Remove the item from the list


                              // Remove the item from the AnimatedList
                              key.currentState!.removeItem(
                                index,
                                    (context, animation) => SizeTransition(
                                      // scale: animation,
                                      sizeFactor:animation,
                                      child: Card(
                                        elevation: 5,

                                        child: Container(
                                          color: Colors.white,
                                          child: ListTile(
                                            leading: CircleAvatar(
                                              backgroundColor: Colors.cyan.shade50,
                                              child: Icon(Icons.ac_unit,
                                                color: Colors.cyan,),
                                            ),
                                            title: Text("removing item "),
                                            subtitle: Text("Sub Title"),
                                            trailing: IconButton(
                                              onPressed: (){

                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                                size: 20,
                                              ),
                                            ),


                                          ),
                                        ),
                                      ),
                                    ),

                                duration: Duration(milliseconds: 500),
                              );

                              items.removeAt(index);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),


                        ),
                      ),
                    ),
                  );
                },

              ),
            ),
            TextButton(onPressed: (){

              var index=items.length;

              setState(() {

                items.add("item${index+1}");
                key.currentState!.insertItem(index);
              });
            },
                child: Text("Add Item"))
          ],
        )
    );
  }
}
