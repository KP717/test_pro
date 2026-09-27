

import 'package:flutter/material.dart';

class TweenAnimationScreen extends StatefulWidget{
  const TweenAnimationScreen({super.key});

  @override
  State<TweenAnimationScreen> createState()=> _TweenAnimationScreen();
}


class _TweenAnimationScreen extends State<TweenAnimationScreen>{

  double endValue = 100;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Tween Animation"),),
      body: Column(children: [
        Flexible(child: Center(
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: endValue), 
            duration: const Duration(seconds: 1), 
            builder: (context, value, child){
              return Container(
                width: value, 
                height: value,
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(color: Colors.purple,borderRadius: BorderRadius.circular(value / 8)),
                child: child
              );
            }),
        ))
      ],),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState((){
            endValue = endValue == 100 ? 0 : 100;
          });
        },
        backgroundColor: Colors.purple,
        child:Icon(Icons.update, color: Colors.white,),
      ),
    );
  }

}