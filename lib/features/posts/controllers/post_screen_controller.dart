
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_pro/core/routes/route_constant.dart';
import 'package:test_pro/features/posts/presentation/bloc/posts_screen_permission_bloc.dart';
import 'package:test_pro/features/posts/presentation/widgets/notification_permission_bottomsheet.dart';
import 'package:test_pro/features/posts/presentation/widgets/post_comment_widget.dart';
import 'package:test_pro/testing/widget_test/widget_test_home_page.dart';
import '../presentation/bloc/postBloc/post_bloc.dart';
import '../presentation/bloc/postBloc/post_event.dart';

class PostScreenController {

  BuildContext context;

  PostScreenController(this.context);

  void init()async{
    context.read<PostBloc>().add(FetchPostEvent());
    await _validateAndCheckPermissions();
  }

  void onCreatePostEvent(BuildContext context)async{
    context.push(RouteConstant.createPostScreen, extra: context.read<PostBloc>());

  }

  void onCommentClick({required int postId})async{

    showModalBottomSheet(context:context , builder: (_){
      return PostCommentWidget(postId: postId,);
    });

  }

  void onPeriodicStreamOptionClick(){
    context.push(RouteConstant.periodicStreamScreen);
  }

  void onChatOptionClick(){
    context.push(RouteConstant.chatScreen);
  }

  void onAnimationOptionClick(){
    context.push(RouteConstant.animationScreen);
  }

  void onGraphQLClick(){
    context.push(RouteConstant.graphQLScreen);
  }

  void onCacelButtonClick(){
    context.read<PostBloc>().add(CancleFetchPostEvent());
  }

  void onWidgetTestingClick(){
    Navigator.push(context,MaterialPageRoute(builder: (context) => WigetTestHomePage()));
  }


  Future<void> _validateAndCheckPermissions()async{
    
    PermissionStatus notificationStatus = await Permission.notification.status;

    if(notificationStatus != PermissionStatus.granted){
      _showNotificationPermissionBottomSheet(notificationStatus: notificationStatus);
    }
  }


  void _showNotificationPermissionBottomSheet({required PermissionStatus notificationStatus}){
    showModalBottomSheet(context: context, builder: (context){
      
      return NotificationPermissionBottomsheet();
    });
  }

}