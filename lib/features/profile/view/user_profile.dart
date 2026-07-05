import 'package:flutter/material.dart';
import 'package:test_pro/features/profile/viewmode/user_profile_view_model.dart';
import '../../../core/widget/custom_elevated_button.dart';

class UserProfile extends StatefulWidget{
  const UserProfile({super.key});

  @override
  State<StatefulWidget> createState() => _UserProfileState();

}


class _UserProfileState extends State<UserProfile>{

  late UserProfileViewModel _viewModel;

  @override
  void initState() {
    _viewModel = UserProfileViewModel()..init(context: context);
    super.initState();
  }

  @override
  Widget build(context){
    return Scaffold(
      appBar: AppBar(title: Text("User Profile"),),
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