
import 'package:flutter/material.dart';
import 'package:test_pro/features/login/presentation/controllers/signup_controller.dart';

class SignUpScreen extends StatefulWidget{

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();

}

class _SignUpScreenState extends State<SignUpScreen> {

  late SignupController _controller;
  @override
  initState() {
    _controller = SignupController(context)..init();

    super.initState();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children:[

              Icon(Icons.verified_user_sharp, size: 120, color: Theme.of(context).primaryColor),
              const SizedBox(height: 24),
              const Text("Enter email and passwor to signup",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
              const SizedBox(height: 24),
              _textFormField(lableText: "Email", controller: _controller.emailController),
              const SizedBox(height: 16),
              _textFormField(lableText: "Password", controller: _controller.passwordController),
              const SizedBox(height: 36),
              ElevatedButton(
                key:const Key("sign_button"),
                onPressed: _controller.onSignUpEvent,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor, 
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))  
                  ),
                child: const Text("Sign Up",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),)
              ),
            ]
          ),
        )
      )
    );
  }


  TextFormField _textFormField({required String lableText, required TextEditingController controller}){
    return TextFormField(
      controller: controller,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.black.withOpacity(.4)),
      decoration: InputDecoration(
        labelText: lableText,
        border:OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}