

import 'package:test_pro/features/posts/domain/entity/post_entity.dart';

abstract class PostState {
  final List<PostEntity> posts;
  PostState({required this.posts});
}

class PostInitialState extends PostState {
  PostInitialState() : super(posts: []);
}

class PostLoadingState extends PostState {
  PostLoadingState({required super.posts});
}

class PostLoadedState extends PostState {
  PostLoadedState({required super.posts});
}

class PostErrorState extends PostState{
  final String message;
  PostErrorState({required super.posts, required this.message});
}