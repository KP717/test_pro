
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_pro/core/routes/route_constant.dart';
import '../presentation/bloc/post_bloc.dart';
import '../presentation/bloc/post_event.dart';

class PostScreenController {

  void init(BuildContext context){
    context.read<PostBloc>().add(FetchPostEvent());
  }

  void onCreatePostEvent(BuildContext context)async{
    context.push(RouteConstant.createPostScreen, extra: context.read<PostBloc>());

  }

}