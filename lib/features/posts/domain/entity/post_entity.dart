
import 'package:equatable/equatable.dart';
import 'package:test_pro/features/posts/data/models/post_model.dart';

class PostEntity extends Equatable{

  final int id;
  final int userId;
  final String title;
  final String body;


  const PostEntity({
    required this.id, 
    required this.userId,
    required this.title,
    required this.body
  });

  PostEntity fromModel(PostModel postModel){
    return PostEntity(id: postModel.id, userId: postModel.userId, title: postModel.title, body: postModel.body);
  }

  @override
  List<Object?> get props => [id, userId, title, body];

}