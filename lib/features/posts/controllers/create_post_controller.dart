

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pro/core/usecases/usercases.dart';
import 'package:test_pro/features/posts/domain/entity/post_entity.dart';
import 'package:test_pro/features/posts/domain/usercases/create_post_usecase.dart';
import 'package:test_pro/features/posts/presentation/bloc/post_bloc.dart';
import 'package:test_pro/features/posts/presentation/bloc/post_event.dart';

import '../../../dependency_injection/injection_container.dart';

class CreatePostController {


  late TextEditingController titleController;
  late TextEditingController descriptionController;

  void init(){
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }


  void dispose(){
    try{
      titleController.dispose();
      descriptionController.dispose();
    }catch(_){}
  }

  void onCreateEvent(BuildContext context)async{
    if(titleController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Title is required!")));
      return;
    }

    if(descriptionController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Description is required!")));
      return;
    }

    context.read<PostBloc>().add(CreatePostEvent(
        context: context,
        postEntity: PostEntity(id: 0, userId: 1, title: titleController.text, body: descriptionController.text)));
  }


}