
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pro/features/splash/presentation/bloc/splash_screen_bloc.dart';
import 'package:test_pro/features/splash/presentation/controllers/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget{

  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen>{


  late SplashScreenController _controller;

  @override
  void initState() {
    _controller = SplashScreenController()..init(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: BlocConsumer<SplashScreenBloc, SplashScreenState>(builder: (context,state){
          if(state is SplashScreenErrorState){
            return Text(state.message);
          }
          return Icon(Icons.security_outlined, size: 200, color: Theme.of(context).primaryColor,);
      },listener: (context, state){
        if(state is SplashScreenInitializedState){
          context.read<SplashScreenBloc>().add(ValidateLoginEvent(context));
        }
      },),),
    );
  }
  
}