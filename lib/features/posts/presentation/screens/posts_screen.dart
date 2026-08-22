


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pro/features/posts/presentation/bloc/post_bloc.dart';
import 'package:test_pro/features/posts/presentation/bloc/post_event.dart';
import 'package:test_pro/features/posts/presentation/bloc/post_state.dart';

class PostsScreen extends StatefulWidget{

  const PostsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PostsScreenPage();
}

class _PostsScreenPage extends State<PostsScreen>{

  @override
  void initState() {
    context.read<PostBloc>().add(FetchPostEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,children: [
        FloatingActionButton(
          onPressed: (){
            context.read<PostBloc>().add(FetchPostEvent());
          },
          backgroundColor: Colors.red.shade700,
          child: Icon(Icons.refresh,color: Colors.white),
        ),
        const SizedBox(height: 12,),
        FloatingActionButton(
          onPressed: (){},
          backgroundColor: Colors.green.shade700,
          child: Icon(Icons.add,color: Colors.white),
        ),
      ],),
      appBar: AppBar(title: Text("Posts Screen"),actionsPadding: EdgeInsets.only(right: 16),actions: [Icon(Icons.more_vert,color: Colors.white,)],),
        body: BlocBuilder<PostBloc, PostState>(builder: (context,state){

        if(state is PostLoadingState){
          return Center(child: CircularProgressIndicator());
        }else if(state is PostLoadedState){
          return ListView.builder(
            itemCount: state.posts.length,
            itemBuilder: (context,index){
              final post = state.posts[index];

              return Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                margin: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(width: 1,color: Colors.black)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.title, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800, color: Colors.black.withOpacity(.7))),
                    Text(post.body, style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(.6)),)
                  ],
                ),);
            },
          );
        }else if(state is PostErrorState){
          return Center(child: Text(state.message));
        }

        return Center(child: ElevatedButton(
          onPressed: (){
            context.read<PostBloc>().add(FetchPostEvent());
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade700), 
          child: Icon(Icons.refresh,color: Colors.white,),));
      }),
    );
  }
}