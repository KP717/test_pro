
import 'package:flutter/material.dart';
import 'package:test_pro/features/login/presentation/controllers/login_screen_controller.dart';

class LoginScreen extends StatefulWidget{

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {

  late LoginScreenController _controller;

  @override
  initState() {
    _controller = LoginScreenController()..init(context);
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
      appBar: AppBar(title: const Text("Login")),
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
              _textFormField(lableText: "Username", controller: _controller.usernameController),
              const SizedBox(height: 16),
              _textFormField(lableText: "Password", controller: _controller.passwordController),
              const SizedBox(height: 36),
              ElevatedButton(
                onPressed: _controller.onLoginEvent,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor, 
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))  
                  ),
                child: const Text("Login",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),)
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed:(){},
                    child: const Text("Forgot Password?",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black54),)
                  ),
                ],
              )
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