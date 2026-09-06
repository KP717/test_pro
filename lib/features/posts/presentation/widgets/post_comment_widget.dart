import 'package:flutter/material.dart';
import 'package:test_pro/features/posts/domain/entity/post_comment_entity.dart';
import '../../controllers/post_comment_controller.dart';

class PostCommentWidget extends StatefulWidget {

  final int postId;

  const PostCommentWidget({super.key, required this.postId});

  @override
  State<PostCommentWidget> createState() => _PostCommentWidgetState();
}

class _PostCommentWidgetState extends State<PostCommentWidget> {

  late PostCommentController _controller;

  @override
  void initState() {
    _controller = PostCommentController()..init(context: context, postId: widget.postId);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Comments: ",style: TextStyle(color: Colors.red.shade900,fontSize: 16, fontWeight: FontWeight.w800),),
          Expanded(
            child: StreamBuilder(
                stream: _controller.streamController.stream,
                initialData: (error: "", postComentEntityList: <PostCommentEntity>[]),
                builder: (context, snapshot){

                  if(snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString()));
                  }

                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                  }

                  String responseError = snapshot.data?.error ?? "";

                  if(responseError.isNotEmpty){
                    return Center(child: Text(responseError));
                  }

                  List<PostCommentEntity> postCommentEntityList = snapshot.data?.postComentEntityList ?? [];

                  if(postCommentEntityList.isEmpty){
                    return Center(child: Text("No Comments"));
                  }

                  return ListView.builder(
                    itemCount: postCommentEntityList.length,
                      itemBuilder: (context, index){
                      PostCommentEntity postCommentEntity = postCommentEntityList[index];
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                          margin: EdgeInsets.symmetric(vertical: 2),
                          decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1), borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            Text(postCommentEntity.name.toString(),style: TextStyle(fontWeight: FontWeight.w800,fontSize: 16),),
                            SizedBox(height: 2,),
                            Text(postCommentEntity.body.toString()),
                          ],),
                        );

                      }
                  );

                }
            ),
          ),
        ],
      ),
    );
  }
}
