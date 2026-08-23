
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pro/features/comments/domain/entity/comment_entity.dart';
import 'package:test_pro/features/comments/presentation/bloc/comment_bloc.dart';
import 'package:test_pro/features/comments/presentation/controller/comment_screen_controller.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {

  late CommentScreenController _controller;

  @override
  void initState() {
    _controller = CommentScreenController()..init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Comments")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<CommentBloc, CommentState>(builder: (context,state){
          if(state is CommentErrorState){
            return Center(child: Text(state.message, textAlign: TextAlign.center,),);
          }else if(state is CommentLoadedState){

            if(state.commentList.isEmpty){
              return Center(child: Text("No Comments"),);
            }

            return ListView.builder(
              itemCount: state.commentList.length,
                itemBuilder:(context, index){

                CommentEntity commentEntity = state.commentList[index];

                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black, width: 1)),
                    child: ListTile(
                      title: Text(commentEntity.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 18),),
                      subtitle: Text(commentEntity.body, style: TextStyle(color: Colors.black.withOpacity(.6), fontSize: 16),),
                    ),
                  );
                }
            );
          }

          return Center(child: CircularProgressIndicator());
        }),
      )
    );
  }
}
