

import 'package:flutter/material.dart';
import 'package:test_pro/testing/widget_test/user.dart';
import 'package:test_pro/testing/widget_test/widget_test_user_home.dart';

class WidgetTestHomePageController {

  BuildContext context;
  late ValueNotifier<int> countListener;

  WidgetTestHomePageController({required this.context});

  void init(){
    countListener = ValueNotifier<int>(0);
  }

  void increamentCounter(){
    countListener.value = countListener.value + 1;
  }
  void decreamentCounter(){
      countListener.value = countListener.value - 1;
  }

  void onAsyncClick(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> WidgetTestUserHome(getUsers: getUsers(),)));
  }

  Future<List<User>> getUsers()async{

    await Future.delayed(const Duration(seconds: 2));
    
    return <User>[
      User(id: 1, name: "Kumar Pawar", email: "kumar@gmail.com"),
      User(id: 2, name: "Vimal Pawar", email: "kumar@gmail.com"),
      User(id: 3, name: "Komal Pawar", email: "kumar@gmail.com"),
      User(id: 4, name: "Pramal Pawar", email: "kumar@gmail.com"),
      User(id: 5, name: "Hemal Pawar", email: "kumar@gmail.com"),
      User(id: 6, name: "Femal Pawar", email: "kumar@gmail.com"),
      User(id: 7, name: "Semal Pawar", email: "kumar@gmail.com"),
      User(id: 1, name: "Kumar Pawar", email: "kumar@gmail.com"),
      User(id: 2, name: "Vimal Pawar", email: "kumar@gmail.com"),
      User(id: 3, name: "Komal Pawar", email: "kumar@gmail.com"),
      User(id: 4, name: "Pramal Pawar", email: "kumar@gmail.com"),
      User(id: 5, name: "Hemal Pawar", email: "kumar@gmail.com"),
      User(id: 6, name: "Femal Pawar", email: "kumar@gmail.com"),
      User(id: 7, name: "Semal Pawar", email: "kumar@gmail.com"),
      User(id: 1, name: "Kumar Pawar", email: "kumar@gmail.com"),
      User(id: 2, name: "Vimal Pawar", email: "kumar@gmail.com"),
      User(id: 3, name: "Komal Pawar", email: "kumar@gmail.com"),
      User(id: 4, name: "Pramal Pawar", email: "kumar@gmail.com"),
      User(id: 5, name: "Hemal Pawar", email: "kumar@gmail.com"),
      User(id: 6, name: "Femal Pawar", email: "kumar@gmail.com"),
      User(id: 7, name: "Semal Pawar", email: "kumar@gmail.com"),
      User(id: 1, name: "Kumar Pawar", email: "kumar@gmail.com"),
      User(id: 2, name: "Vimal Pawar", email: "kumar@gmail.com"),
      User(id: 3, name: "Komal Pawar", email: "kumar@gmail.com"),
      User(id: 4, name: "Pramal Pawar", email: "kumar@gmail.com"),
      User(id: 5, name: "Hemal Pawar", email: "kumar@gmail.com"),
      User(id: 6, name: "Femal Pawar", email: "kumar@gmail.com"),
      User(id: 7, name: "Semal Pawar", email: "kumar@gmail.com"),
      User(id: 1, name: "Kumar Pawar", email: "kumar@gmail.com"),
      User(id: 2, name: "Vimal Pawar", email: "kumar@gmail.com"),
      User(id: 3, name: "Komal Pawar", email: "kumar@gmail.com"),
      User(id: 4, name: "Pramal Pawar", email: "kumar@gmail.com"),
      User(id: 5, name: "Hemal Pawar", email: "kumar@gmail.com"),
      User(id: 6, name: "Femal Pawar", email: "kumar@gmail.com"),
      User(id: 7, name: "Semal Pawar", email: "kumar@gmail.com"),
      User(id: 1, name: "Kumar Pawar", email: "kumar@gmail.com"),
      User(id: 2, name: "Vimal Pawar", email: "kumar@gmail.com"),
      User(id: 3, name: "Komal Pawar", email: "kumar@gmail.com"),
      User(id: 4, name: "Pramal Pawar", email: "kumar@gmail.com"),
      User(id: 5, name: "Hemal Pawar", email: "kumar@gmail.com"),
      User(id: 6, name: "Femal Pawar", email: "kumar@gmail.com"),
      User(id: 7, name: "Semal Pawar", email: "kumar@gmail.com"),
    ];
  }

}