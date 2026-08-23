



import 'package:flutter/cupertino.dart';
import 'package:test_pro/features/posts/domain/entity/post_entity.dart';

abstract class PostEvent {}


class FetchPostEvent extends PostEvent {}

class CreatePostEvent extends PostEvent{
  final PostEntity postEntity;
  final BuildContext context;
  CreatePostEvent({required this.context, required this.postEntity});
}