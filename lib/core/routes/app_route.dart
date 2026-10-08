

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_pro/features/animation/presentation/screens/animation_screen.dart';
import 'package:test_pro/features/animation/presentation/screens/hero_animation_details.dart';
import 'package:test_pro/features/animation/presentation/screens/transition_animations_screen.dart';
import 'package:test_pro/features/animation/presentation/screens/tween_animation_screen.dart';
import 'package:test_pro/features/chat/presentation/screens/chat_screen.dart';
import 'package:test_pro/features/comments/presentation/bloc/comment_bloc.dart';
import 'package:test_pro/features/comments/presentation/screen/comment_screen.dart';
import 'package:test_pro/features/graphql/presentation/graphql_screen.dart';
import 'package:test_pro/features/periodic_stream/presentation/bloc/periodic_stream_bloc.dart';
import 'package:test_pro/features/periodic_stream/presentation/screens/periodic_stream_screen.dart';
import 'package:test_pro/features/posts/presentation/bloc/postBloc/post_bloc.dart';
import 'package:test_pro/features/posts/presentation/bloc/posts_screen_permission_bloc.dart';
import 'package:test_pro/features/posts/presentation/screens/create_post_screen.dart';
import 'package:test_pro/features/posts/presentation/screens/posts_screen.dart';
import 'package:test_pro/features/login/presentation/screen/login_screen.dart';
import 'package:test_pro/features/profile/view/user_profile_screen.dart';
import 'package:test_pro/core/routes/route_constant.dart';
import 'package:test_pro/features/splash/presentation/screens/splash_screen.dart';
import 'package:test_pro/testing/integration_test/integration_test_home.dart';

class AppRoute {

  static final router = GoRouter(
    initialLocation: RouteConstant.loginScreen,
      routes: [
        GoRoute(path: RouteConstant.loginScreen, builder: (context, state)=> LoginScreen(key: const Key("login_page"))),
        GoRoute(path: RouteConstant.splashScreen, builder: (context, state)=> SplashScreen()),
        GoRoute(path: RouteConstant.integrationTestHome, builder: (context, state)=> IntegrationTestHome()),
        GoRoute(path: RouteConstant.postsScreen, builder: (context, state)=> MultiBlocProvider(providers: [
          BlocProvider(create: (context)=> PostBloc()),
        ], child: PostsScreen())),

        GoRoute(path: RouteConstant.createPostScreen, builder: (context, state){
          if(state.extra == null){
            return CreatePostScreen();
          }
          return BlocProvider.value(value: state.extra as PostBloc, child: CreatePostScreen(),);
        }),

        GoRoute(path: RouteConstant.commentScreen, builder: (context, state)=> BlocProvider(create: (context)=> CommentBloc(), child: CommentScreen(),)),
        GoRoute(path: RouteConstant.periodicStreamScreen, builder: (context, state)=> BlocProvider(create: (context)=> PeriodicStreamCubit(), child: PeriodicStreamScreen(),)),

        GoRoute(path: RouteConstant.userProfileScreen, builder: (context, state){
          return UserProfileScreen(arguments: _getExtras(state.extra));
        }),

        GoRoute(path: RouteConstant.chatScreen, builder: (context, state)=> ChatScreen()),
        GoRoute(path: RouteConstant.animationScreen, builder: (context, state)=> AnimationScreen()),
        GoRoute(path: RouteConstant.heroAnimationScreen, builder: (context, state)=> HeroAnimationDetailsScreen()),
        GoRoute(path: RouteConstant.tweenAnmationScreen, builder: (context, state)=> TweenAnimationScreen()),
        GoRoute(path: RouteConstant.transitionAnimationScreen, builder: (context, state)=> TransitionAnimationsScreen()),
        GoRoute(path: RouteConstant.graphQLScreen, builder: (context, state)=> GraphQLScreen()),

    ]
  );


  static Map<String,dynamic>? _getExtras(Object? extra){
    return extra != null ? extra as Map<String,dynamic>? : null;
  }

}