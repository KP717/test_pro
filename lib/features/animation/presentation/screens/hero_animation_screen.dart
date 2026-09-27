

import 'package:flutter/material.dart';
import 'package:test_pro/features/animation/presentation/screens/hero_animation_details.dart';

class HeroAnimationScreen extends StatefulWidget{
  const HeroAnimationScreen({super.key});

  @override
  State<HeroAnimationScreen> createState()=> _TweenAnimationScreen();
}


class _TweenAnimationScreen extends State<HeroAnimationScreen>{


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Hero Animation"),),
      body: SizedBox(width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(20),
            //   child: Hero(
            //     tag: "assets/user_image",
            //     child: Image.asset("assets/user_image.png", width: 300, height:200, fit: BoxFit.cover))
            // ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Hero(
                tag: "network/image",
                child: Image.network("https://picsum.photos/200/300",width: 300, height: 200,fit: BoxFit.fill,)
              )
            ),
            Flexible(child: FractionallySizedBox(heightFactor: 0.1,)),
          
            _elevatedButton(lable: "Open Details",onPress: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> HeroAnimationDetailsScreen()));
            }),
          ],
        ),
      ),
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