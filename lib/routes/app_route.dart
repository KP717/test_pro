

import 'package:go_router/go_router.dart';
import 'package:test_pro/features/home/view/home_screen.dart';
import 'package:test_pro/features/profile/view/user_profile_screen.dart';
import 'package:test_pro/routes/route_constant.dart';

class AppRoute {



  static final router = GoRouter(
    initialLocation: RouteConstant.homeScreen,
      routes: [
        GoRoute(path: RouteConstant.homeScreen, builder: (context, state)=> HomeScreen()),
        GoRoute(path: RouteConstant.userProfileScreen, builder: (context, state){
          return UserProfileScreen(arguments: _getExtras(state.extra));
        }),
    ]
  );


  static Map<String,dynamic>? _getExtras(Object? extra){
    return extra != null ? extra as Map<String,dynamic>? : null;
  }

}