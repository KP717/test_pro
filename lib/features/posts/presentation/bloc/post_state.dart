

import 'package:equatable/equatable.dart';
import 'package:test_pro/features/posts/domain/entity/post_entity.dart';

abstract class PostState extends Equatable{
  final List<PostEntity> posts;
  const PostState({required this.posts});

  @override
  List<Object?> get props => [posts];
}

class PostInitialState extends PostState {
  PostInitialState() : super(posts: []);
}

class PostLoadingState extends PostState {
  const PostLoadingState({required super.posts});
}

class PostLoadedState extends PostState {
  final bool canPop;
  String? error;
  PostLoadedState({this.canPop = false, this.error, required super.posts});
}

class PostErrorState extends PostState{
  final String message;
  const PostErrorState({required super.posts, required this.message});
}

class RequestCancelledState extends PostState{
  final String message;
  const RequestCancelledState({required super.posts, required this.message});
}