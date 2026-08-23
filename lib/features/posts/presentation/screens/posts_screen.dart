


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_pro/core/routes/route_constant.dart';
import 'package:test_pro/features/posts/presentation/bloc/post_bloc.dart';
import 'package:test_pro/features/posts/presentation/bloc/post_event.dart';
import 'package:test_pro/features/posts/presentation/bloc/post_state.dart';

import '../../controllers/post_screen_controller.dart';

class PostsScreen extends StatefulWidget{

  const PostsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PostsScreenPage();
}

class _PostsScreenPage extends State<PostsScreen>{

  late PostScreenController _controller;

  @override
  void initState() {
    _controller = PostScreenController()..init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,children: [
        SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: (){
              context.read<PostBloc>().add(FetchPostEvent());
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade900,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            child: Icon(Icons.refresh,color: Colors.white),
          ),
        ),
        const SizedBox(height: 12,),
        SizedBox(height: 50,
          child: ElevatedButton(
            onPressed: ()=> _controller.onCreatePostEvent(context),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade900,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            child: Icon(Icons.add,color: Colors.white),
          ),
        ),
      ],),
      appBar: AppBar(
        title: Text("Posts"),
        actionsPadding: EdgeInsets.only(right: 8),
        actions: [
          MenuAnchor(
            style:MenuStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white)),
              builder: (context, controller, child){
                return IconButton(onPressed: (){

                  controller.isOpen ? controller.close() : controller.open();

                }, icon: Icon(Icons.more_vert_outlined));
              },
              menuChildren: [
                MenuItemButton(
                  leadingIcon:Icon( Icons.comment, color: Colors.black,size: 16,),
                  child: Text("Comments", style: TextStyle(color: Colors.black, fontSize: 14),),
                  onPressed: (){
                    context.push(RouteConstant.commentScreen);
                  },
                ),
                MenuItemButton(
                  leadingIcon:Icon( Icons.person, color: Colors.black,size: 16,),
                  child: Text("Profile", style: TextStyle(color: Colors.black, fontSize: 14),),
                ),
              ])
        ],),
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