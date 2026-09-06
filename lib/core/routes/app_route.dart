

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_pro/features/comments/presentation/bloc/comment_bloc.dart';
import 'package:test_pro/features/comments/presentation/screen/comment_screen.dart';
import 'package:test_pro/features/periodic_stream/presentation/bloc/periodic_stream_bloc.dart';
import 'package:test_pro/features/periodic_stream/presentation/screens/periodic_stream_screen.dart';
import 'package:test_pro/features/posts/presentation/bloc/post_bloc.dart';
import 'package:test_pro/features/posts/presentation/screens/create_post_screen.dart';
import 'package:test_pro/features/posts/presentation/screens/posts_screen.dart';
import 'package:test_pro/features/login/presentation/screen/login_screen.dart';
import 'package:test_pro/features/profile/view/user_profile_screen.dart';
import 'package:test_pro/core/routes/route_constant.dart';
import 'package:test_pro/features/splash/presentation/screens/splash_screen.dart';

class AppRoute {

  static final router = GoRouter(
    initialLocation: RouteConstant.splashScreen,
      routes: [
        GoRoute(path: RouteConstant.loginScreen, builder: (context, state)=> LoginScreen()),
        GoRoute(path: RouteConstant.splashScreen, builder: (context, state)=> SplashScreen()),
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
    ]
  );


  static Map<String,dynamic>? _getExtras(Object? extra){
    return extra != null ? extra as Map<String,dynamic>? : null;
  }

}