


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pro/features/home/presentation/bloc/post_bloc.dart';
import 'package:test_pro/features/home/presentation/bloc/post_event.dart';
import 'package:test_pro/features/home/presentation/bloc/post_state.dart';

class HomeScreen extends StatefulWidget{

  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomeScreen>{

  @override
  void initState() {
    context.read<PostBloc>().add(FetchPostEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
          context.read<PostBloc>().add(FetchPostEvent());
      },
      backgroundColor: Colors.red.shade700,
      child: Icon(Icons.refresh,color: Colors.white),),
      appBar: AppBar(title: Text("Posts Screen"),actionsPadding: EdgeInsets.only(right: 16),actions: [Icon(Icons.more_vert,color: Colors.white,)],),
        body: BlocBuilder<PostBloc, PostState>(builder: (context,state){

        if(state is PostLoadingState){
          return Center(child: CircularProgressIndicator());
        }else if(state is PostLoadedState){
          return ListView.builder(
            itemCount: state.posts.length,
            itemBuilder: (context,index){
              final post = state.posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              );
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