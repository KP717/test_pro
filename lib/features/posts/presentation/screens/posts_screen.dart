


import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_pro/core/routes/route_constant.dart';
import 'package:test_pro/features/posts/presentation/bloc/postBloc/post_bloc.dart';
import 'package:test_pro/features/posts/presentation/bloc/postBloc/post_event.dart';
import 'package:test_pro/features/posts/presentation/bloc/postBloc/post_state.dart';

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

    final AppLinks appLinks = AppLinks();

    appLinks.uriLinkStream.listen((Uri uri){
      print("deep link URI:  $uri");
    });

    _controller = PostScreenController(context)..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,children: [
        SizedBox(height: 50,
          child: ElevatedButton(
            onPressed: _controller.onCacelButtonClick,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade900,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            child: Icon(Icons.cancel_outlined,color: Colors.white),
          ),
        ),
        const SizedBox(height: 12,),
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
                  leadingIcon:Icon( Icons.stream_outlined, color: Colors.black,size: 16,),
                  onPressed: _controller.onPeriodicStreamOptionClick,
                  child: Text("Periodic Streams", style: TextStyle(color: Colors.black, fontSize: 14),),
                ),
                MenuItemButton(
                  leadingIcon:Icon( Icons.comment_bank_outlined, color: Colors.black,size: 16,),
                  child: Text("Comments", style: TextStyle(color: Colors.black, fontSize: 14),),
                  onPressed: (){
                    context.push(RouteConstant.commentScreen);
                  },
                ),
                MenuItemButton(
                  leadingIcon:Icon( Icons.chat_bubble_outline_outlined, color: Colors.black,size: 16,),
                  onPressed: _controller.onChatOptionClick,
                  child: Text("Chat", style: TextStyle(color: Colors.black, fontSize: 14),),
                ),

                MenuItemButton(
                  leadingIcon:Icon( Icons.animation, color: Colors.black,size: 16,),
                  onPressed: _controller.onAnimationOptionClick,
                  child: Text("Animation", style: TextStyle(color: Colors.black, fontSize: 14),),
                ),

                MenuItemButton(
                  onPressed: _controller.onGraphQLClick, 
                  leadingIcon:Icon( Icons.graphic_eq_outlined, color: Colors.black,size: 16,),
                  child: Text("GraphQL", style: TextStyle(color: Colors.black, fontSize: 14),),
                ),
                
                MenuItemButton(
                  onPressed: _controller.onWidgetTestingClick, 
                  leadingIcon:Icon( Icons.person_2_outlined, color: Colors.black,size: 16,),
                  child: Text("Widget Testing", style: TextStyle(color: Colors.black, fontSize: 14),),
                ),

                MenuItemButton(
                  onPressed: (){}, 
                  leadingIcon:Icon( Icons.person_2_outlined, color: Colors.black,size: 16,),
                  child: Text("Profile", style: TextStyle(color: Colors.black, fontSize: 14),),
                ),
              ])
        ],),
        body: BlocBuilder<PostBloc, PostState>(builder: (context,state){

        if(state is PostLoadingState){
          return Center(child: CircularProgressIndicator());
        }else if(state is PostLoadedState || state is RequestCancelledState){

          if(state is RequestCancelledState){
            print("Request is cancelled");
          }

          if(state.posts.isEmpty){
            return Center(child: Text("No Posts!", style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w700),),);
          }

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
                    Text(post.body, style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(.6)),),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap:()=> _controller.onCommentClick(postId: post.id),
                          child: const SizedBox(
                            height: 20, 
                            child: Text("View Comment",style: TextStyle(color: Colors.blue,fontSize: 12),))
                        ),
                    ],)
                  ],
                ),);
            },
          );
        }else if(state is PostErrorState){
          return Center(child: Padding(padding: const EdgeInsetsGeometry.symmetric(horizontal: 24), child: Text(state.message, textAlign: TextAlign.center,),));
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