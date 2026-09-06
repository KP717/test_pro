

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:test_pro/features/posts/domain/entity/post_comment_entity.dart';
import 'package:test_pro/features/posts/domain/usercases/get_post_comment_usecase.dart';

class PostCommentController {

  late BuildContext context;
  late StreamController<({String error, List<PostCommentEntity> postComentEntityList})> streamController;

  void init({required BuildContext context, required int postId}){
    this.context = context;
    streamController = StreamController<({String error, List<PostCommentEntity> postComentEntityList})>();
    _getPostComment(postId);
  }


  void _getPostComment(int postId)async{
    GetPostCommentUseCase useCase = GetPostCommentUseCase();

    var result  = await useCase.call(postId);

    result.fold((error){
      streamController.sink.add((error: error.toString(), postComentEntityList: []));
    }, (response){
      streamController.sink.add((error: "", postComentEntityList: response));
    });
  }

  void dispose(){
    streamController.close();
  }

}