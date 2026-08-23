

class CommentEntity {

  int postId;
  int id;
  String name;
  String email;
  String body;

  CommentEntity({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body
  });
  
}