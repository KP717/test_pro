

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pro/features/comments/presentation/bloc/comment_bloc.dart';

class CommentScreenController {

  void init(BuildContext context){

    context.read<CommentBloc>().add(FetchCommentEvent());
  }

}