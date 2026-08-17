
import 'package:test_pro/features/home/domain/entity/post_entity.dart';

class PostModel extends PostEntity {

  const PostModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.body,
  });

  factory PostModel.fromEntity(PostEntity postEntity) {
    return PostModel(
      id: postEntity.id,
      userId: postEntity.userId,
      title: postEntity.title,
      body: postEntity.body,
    );
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'userId': userId,
      'body': body,
    };
  }
}