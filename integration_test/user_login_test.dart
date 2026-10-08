


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test_pro/core/storage/preference_manager.dart';
import 'package:test_pro/main.dart' as app;





void main(){

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();


  setUp((){

  });

  group("user login integration test group",(){

    testWidgets(
      "provided the username and password to test the login page", 
      (tester)async{
        app.main();

        await tester.pump(const Duration(seconds: 2));

        await tester.pumpAndSettle();

        await PreferenceManager.init();

        // validating if login page is loaded
        expect(find.byKey(const Key("login_page")), findsOneWidget);

        // expecting textformfields in the page
        expect(find.byType(TextFormField), findsNWidgets(2));
        
        await tester.enterText(find.byType(TextFormField).at(0), "kumar.pawar");
        await tester.enterText(find.byType(TextFormField).at(1), "kumar@123");

        Finder loginBtn = find.byKey(const Key("login_button"));
        
        expect(loginBtn, findsOneWidget);

        await tester.tap(loginBtn);

        await tester.pumpAndSettle();

        final postAppBar = find.byType(AppBar);

        expect(postAppBar, findsOneWidget);

        final postAppBarWidget = tester.widget<AppBar>(postAppBar);

        expect((postAppBarWidget.title as Text).data, 'Posts');

      }
    );

  });
}