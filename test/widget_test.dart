import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_pro/testing/widget_test/widget_test_home_page.dart';

void main(){


  testWidgets("testing widgets in homepage", (tester)async{

    await tester.pumpWidget(MaterialApp(home: const WigetTestHomePage(),));

    final ctrl =  find.text('0');

    expect(ctrl, findsOneWidget);


    final elevatedButton = find.byKey(Key("increase_button"));
    expect(elevatedButton, findsOneWidget);

    expect(elevatedButton, findsOneWidget);

    await tester.tap(elevatedButton);

    await tester.pump();

    final textWidget = find.text('1');

    expect(textWidget, findsOneWidget);

    final decreaseButton = find.byKey(Key("decrease_button"));
    expect(decreaseButton, findsOneWidget);


  });
}