

import 'package:equatable/equatable.dart';
import 'package:test_pro/features/posts/domain/entity/post_entity.dart';

abstract class PostState extends Equatable{
  final List<PostEntity> posts;
  PostState({required this.posts});

  @override
  List<Object?> get props => [posts];
}

class PostInitialState extends PostState {
  PostInitialState() : super(posts: []);
}

class PostLoadingState extends PostState {
  PostLoadingState({required super.posts});
}

class PostLoadedState extends PostState {
  bool canPop;
  String? error;
  PostLoadedState({this.canPop = false, this.error, required super.posts});
}

class PostErrorState extends PostState{
  final String message;
  PostErrorState({required super.posts, required this.message});
}