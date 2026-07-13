import 'package:flutter/material.dart';
import 'package:test_pro/dependency_injection/injection_container.dart';
import 'package:test_pro/routes/app_route.dart';

void main(){

  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runApp(MyApp());
}


class MyApp extends StatelessWidget{

  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      routerConfig: AppRoute.router,
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
    );
  }
}
