


import 'package:flutter/widgets.dart';

class IntegrationTestHomeController {

  BuildContext context;
  late ValueNotifier<int> counter;

  IntegrationTestHomeController(this.context);

  void init(){
    counter = ValueNotifier<int>(0);
  }

  void increament(){
    counter.value = counter.value + 1;
  }

  void decrement(){
    counter.value = counter.value - 1;
  }

}