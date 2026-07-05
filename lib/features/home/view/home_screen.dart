


import 'package:flutter/material.dart';
import 'package:test_pro/core/widget/custom_elevated_button.dart';
import 'package:test_pro/features/home/viewmodel/home_screen_view_model.dart';

class HomeScreen extends StatefulWidget{

  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomeScreen>{


  late HomeScreenViewModel _viewModel;

  @override
  void initState() {

    _viewModel = HomeScreenViewModel()..init(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen"),actionsPadding: EdgeInsets.only(right: 16),actions: [Icon(Icons.more_vert,color: Colors.white,)],),
      body: SizedBox(width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomElevatedButton(title: "User Profile ->", onPress: _viewModel.goToUserProfile)
          ],
        ),
      ),
    );
  }
}