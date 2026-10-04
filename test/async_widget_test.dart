


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_pro/testing/widget_test/user.dart';
import 'package:test_pro/testing/widget_test/widget_test_user_home.dart';

void main(){


  testWidgets(
    "given a list of users when users list is fetched then it should have listview and other widgets", 
    (tester)async{

      List<User> users = [
          User(id: 1, name: "Kumar Pawar", email: "kumar@gmail.com"),
          User(id: 2, name: "Vimal Pawar", email: "kumar@gmail.com"),
          User(id: 3, name: "Komal Pawar", email: "kumar@gmail.com"),
        ];

      Future<List<User>> getUser()async{
        await Future.delayed(const Duration(seconds: 2));
        return users;
      }

      await tester.pumpWidget(MaterialApp(home: WidgetTestUserHome(getUsers: getUser()),));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();

      // expect(find.byKey(Key("no_data")), findsOneWidget);

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(users.length));


    }
  );

}