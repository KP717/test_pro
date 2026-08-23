

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pro/features/posts/controllers/create_post_controller.dart';
import 'package:test_pro/features/posts/controllers/post_screen_controller.dart';
import 'package:test_pro/features/posts/presentation/bloc/post_bloc.dart';
import 'package:test_pro/features/posts/presentation/bloc/post_state.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {


  late CreatePostController _controller;

  @override
  void initState() {
    _controller = CreatePostController()..init();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Post")),
      body: BlocListener<PostBloc, PostState>(listener: (context,state){
        if(state is PostLoadedState){
          if(state.error != null){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error.toString())));
          }
          if(state.canPop == true)Navigator.pop(context);
        }

      }, child: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text("Title",style: TextStyle(fontWeight: FontWeight.w800),),
            _textFormField(controller: _controller.titleController),
            const SizedBox(height: 12,),
            Text("Description",style: TextStyle(fontWeight: FontWeight.w800),),
            _descriptionTextField(controller: _controller.descriptionController),
            const SizedBox(height: 24,),
            ElevatedButton(
                onPressed: ()=> _controller.onCreateEvent(context),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                ),
                child: const Text("Create",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),)
            )
          ],),),
      ),),
    );
  }


  TextFormField _textFormField({required TextEditingController controller}){
    return TextFormField(
      controller: controller,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.black.withOpacity(.4)),
      decoration: InputDecoration(
        border:OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  SizedBox _descriptionTextField({required TextEditingController controller}){
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .3,
      child: TextFormField(
        controller: controller,
        expands: true,
        maxLines:null,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.top,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.black.withOpacity(.4)),
        decoration: InputDecoration(
          border:OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
