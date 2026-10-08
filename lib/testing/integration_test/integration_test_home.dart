

import 'package:flutter/material.dart';
import 'package:test_pro/testing/integration_test/integration_test_home_controller.dart';

class IntegrationTestHome extends StatefulWidget {
  const IntegrationTestHome({super.key});

  @override
  State<IntegrationTestHome> createState() => _IntegrationTestHomeState();
}

class _IntegrationTestHomeState extends State<IntegrationTestHome> {
  
  late IntegrationTestHomeController _controller;

  @override
  void initState() {

    _controller = IntegrationTestHomeController(context)..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Integration Testing"),),
      body: SizedBox(width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder(valueListenable: _controller.counter, builder: (context, value, child){
              return Text(value.toString(), key: const Key("counter_text"),style: TextStyle(fontWeight: FontWeight.w800, fontSize: 180),);
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
    
              SizedBox(width: 100, height: 50,
                child: ElevatedButton(
                  key: const Key("decrement_button"),
                  onPressed:_controller.decrement, 
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade900),
                  child: Icon(Icons.delete, color: Colors.white,)
                ),
              ),
              SizedBox(width: 100, height: 50,
                child: ElevatedButton(
                  key:const Key("increament_button"),
                  onPressed: _controller.increament, 
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade900),
                  child: Icon(Icons.add, color: Colors.white,)
                ),
              ),
            ],),
          ],),
      )
    );

  }
}