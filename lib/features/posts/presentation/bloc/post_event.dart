



import 'package:test_pro/features/posts/domain/entity/post_entity.dart';

abstract class PostEvent {}


class FetchPostEvent extends PostEvent {}

class CreatePostEvent extends PostEvent{
  final PostEntity postEntity;
  CreatePostEvent(this.postEntity);
}