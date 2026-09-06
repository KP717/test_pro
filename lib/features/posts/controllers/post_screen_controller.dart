
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_pro/core/routes/route_constant.dart';
import 'package:test_pro/features/posts/presentation/widgets/post_comment_widget.dart';
import '../presentation/bloc/post_bloc.dart';
import '../presentation/bloc/post_event.dart';

class PostScreenController {

  late BuildContext context;
  void init(BuildContext context){

    this.context = context;

    context.read<PostBloc>().add(FetchPostEvent());
  }

  void onCreatePostEvent(BuildContext context)async{
    context.push(RouteConstant.createPostScreen, extra: context.read<PostBloc>());

  }

  void onCommentClick({required int postId})async{

    showModalBottomSheet(context:context , builder: (_){
      return PostCommentWidget(postId: postId,);
    });
  }

  void onPeriodicStreamOptionClick(){
    context.push(RouteConstant.periodicStreamScreen);
  }

}