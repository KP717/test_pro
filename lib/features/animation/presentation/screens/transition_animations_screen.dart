


import 'package:flutter/material.dart';

class TransitionAnimationsScreen extends StatefulWidget{
  const TransitionAnimationsScreen({super.key});

  @override
  State<TransitionAnimationsScreen> createState()=> _TransitionAnimationsScreen();

}

class _TransitionAnimationsScreen extends State<TransitionAnimationsScreen> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  // late Animation<double> _opacityAnimation;
  // late Animation<double> _scaleAnimation;

  late Animation<Offset> _slideTransition;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    // _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _animationController, curve: Curves.bounceOut));
    // _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _animationController, curve: Curves.ease));
    _slideTransition = Tween<Offset>(begin: Offset(-1,1), end: Offset(0,0)).animate(CurvedAnimation(parent: _animationController, curve: Curves.ease));
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Transition Animation"),),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             SlideTransition(
              position: _slideTransition,
              child: Container(
                width: 200,height: 200,
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(12)),
              ),),
          ],
        ),
      )
    );
  }

}