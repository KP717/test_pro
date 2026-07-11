import 'package:flutter/material.dart';
import 'package:test_pro/features/profile/viewmode/user_profile_view_model.dart';
import '../../../core/widget/custom_elevated_button.dart';

class UserProfileScreen extends StatefulWidget{
  final Map<String,dynamic>? arguments;
  const UserProfileScreen({super.key, this.arguments});

  @override
  State<StatefulWidget> createState() => _UserProfileState();

}


class _UserProfileState extends State<UserProfileScreen>{

  late UserProfileViewModel _viewModel;

  @override
  void initState() {
    _viewModel = UserProfileViewModel()..init(context: context,arguments: widget.arguments);
    super.initState();
  }

  @override
  Widget build(context){
    return Scaffold(
      appBar: AppBar(title: Text(_viewModel.title),),
      body: SizedBox(width: double.infinity,
        child: Column(mainAxisAlignment: .center,crossAxisAlignment: .center,
          children: [
            CustomElevatedButton(title: "Back", onPress: _viewModel.pop)
          ],
        ),
      ),
    );
  }
}