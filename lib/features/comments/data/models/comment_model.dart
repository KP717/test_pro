

import 'package:test_pro/features/comments/domain/entity/comment_entity.dart';

class CommentModel extends CommentEntity{

  CommentModel({
    required super.postId,
    required super.id,
    required super.name,
    required super.email,
    required super.body
  });

  factory CommentModel.fromJson(Map<String,dynamic> json){
    return CommentModel(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body']
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body
    };
  }

}