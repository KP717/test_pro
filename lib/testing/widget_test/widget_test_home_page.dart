

import 'package:flutter/material.dart';
import 'package:test_pro/testing/widget_test/widget_test_home_page_controller.dart';

class WigetTestHomePage extends StatefulWidget{

  const WigetTestHomePage({super.key});

  @override
  State<WigetTestHomePage> createState()=> _HomePageStete();

}

class _HomePageStete extends State<WigetTestHomePage>{


  late WidgetTestHomePageController _controller;

  @override
  void initState() {
    _controller = WidgetTestHomePageController(context: context)..init();
    super.initState();
  }
  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: const Key("increase_button"),
            onPressed: _controller.increamentCounter,
            heroTag: "temp_tag",
            backgroundColor: Colors.green,
            child: Icon(Icons.add,color: Colors.white,),
          ),
          SizedBox(height: 12,),
          FloatingActionButton(
            key: const Key("decrease_button"),
            onPressed:_controller.decreamentCounter,
            heroTag: "temp_tag2",
            backgroundColor: Colors.red,
            child: Icon(Icons.delete,color: Colors.white,),
          ),
          SizedBox(height: 12,),
          FloatingActionButton(
            key: const Key("async_button"),
            onPressed: _controller.onAsyncClick,
            heroTag: "temp_tag3",
            backgroundColor: Colors.red,
            child: Text("Async",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
          ),
      ],),
      body: Center(child: ValueListenableBuilder<int>(valueListenable: _controller.countListener, builder: (context, value, child){
        return Text(value.toString(), style: TextStyle(fontSize: 120, fontWeight: FontWeight.w800));
      },)),
    );
  }

}