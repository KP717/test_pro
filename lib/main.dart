import 'package:flutter/material.dart';

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
          backgroundColor: Colors.purple[800],
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.w600),
        ),
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget{

  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Auth Pro"),actionsPadding: EdgeInsets.only(right: 16),actions: [Icon(Icons.more_vert,color: Colors.white,)],),
    );
  }
}