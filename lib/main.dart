import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pro/core/storage/preference_manager.dart';
import 'package:test_pro/dependency_injection/injection_container.dart';
import 'package:test_pro/features/posts/presentation/bloc/post_bloc.dart';
import 'package:test_pro/core/routes/app_route.dart';
import 'package:test_pro/features/splash/presentation/bloc/splash_screen_bloc.dart';

void main(){

  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
  runApp(MyApp());
}



class MyApp extends StatelessWidget{

  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=> PostBloc()),
      BlocProvider(create: (context)=> SplashScreenBloc())
    ],
     child: MaterialApp.router(
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
    ));
  }
}
