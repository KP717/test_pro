



import 'package:flutter/material.dart';

class HeroAnimationDetailsScreen extends StatefulWidget{
  const HeroAnimationDetailsScreen({super.key});

  @override
  State<HeroAnimationDetailsScreen> createState()=> _TweenAnimationScreen();
}


class _TweenAnimationScreen extends State<HeroAnimationDetailsScreen>{


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Hero Animation Details"),),
      body: SizedBox(width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, 
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Hero(
            //   tag: "assets/user_image",
            //   child: Image.asset("assets/user_image.png", width: double.infinity, height: 400, fit: BoxFit.cover)
            // ),

            Hero(
                tag: "network/image",
                child: InteractiveViewer(
                  minScale: 0.5,
                  maxScale: 10.0,
                  child: Image.network("https://picsum.photos/200/300",width: double.infinity, height: 400,fit: BoxFit.fill,))
            ),

            const SizedBox(height: 12,),
            Padding(
              padding: EdgeInsets.all(4),
              child: SelectableText("Sarah is a Senior Product Designer with over 6 years of experience building user-centered digital products"
              " in the fintech and SaaS sectors. At our organization, she leads the design strategy for our core customer web portal,"
               "focusing on streamlining user onboarding and improving overall interface accessibility.""The Operations Manager is responsible for overseeing daily business workflows, optimizing" 
               "cross-departmental communication, and ensuring operational compliance. This role serves as a key bridge between executive strategy and tactical execution to maximize"
               "efficiency and output.", textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontSize: 14),),
            ),
          ],
        ),
      ),
    );
  }

}