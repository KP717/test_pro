import 'package:flutter/material.dart';

import 'features/home/view/home_screen.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.purple[800],
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.w600),
        ),
        primaryColor: Colors.purple[800],
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
          displaySmall: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 14),
          displayMedium: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 16),
          displayLarge: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 18),
        )
      ),
      home: HomeScreen(),
    );
  }
}
