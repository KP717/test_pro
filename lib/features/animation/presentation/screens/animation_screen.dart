import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_pro/core/routes/route_constant.dart';



class AnimationScreen extends StatefulWidget{

  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState()=> _TweenAnimationScreen();

}

class _TweenAnimationScreen extends State<AnimationScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animations"),),
      body: SizedBox(width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _elevatedButton(lable: "Tween Anmimation", onPress: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context)=> TweenAnimationScreen()));
              context.push(RouteConstant.tweenAnmationScreen);
            }),
            _elevatedButton(lable: "Hero Anmimation", onPress: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context)=> HeroAnimationScreen()));
              context.push(RouteConstant.heroAnimationScreen);
            }),

            _elevatedButton(lable: "Transition Anmimation", onPress: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context)=> TransitionAnimationsScreen()));
              context.push(RouteConstant.transitionAnimationScreen);
            }),
          ],
        ),
      )
    );
  }


  ConstrainedBox _elevatedButton({required String lable, required VoidCallback onPress}){
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 200),
      child: ElevatedButton(
            onPressed: onPress,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            child: Text(lable,style: TextStyle(color: Colors.white, fontSize: 16),)
      ),
    );
  }

}