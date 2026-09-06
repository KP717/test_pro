

import 'package:test_pro/features/posts/domain/entity/post_comment_entity.dart';

class PostCommentModel extends PostCommentEntity{

  const PostCommentModel({
    required super.postId,
    required super.id,
    required super.name,
    required super.email,
    required super.body,
  });



  factory PostCommentModel.fromJson(dynamic json){
    return PostCommentModel(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }


}