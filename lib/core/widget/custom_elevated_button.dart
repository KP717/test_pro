

import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget{

  final VoidCallback onPress;
  final String title;
  const CustomElevatedButton({super.key, required this.title, required this.onPress});

  @override
  Widget build(context){

    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor,),
        child: Text(title,style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white),)
    );

  }


}