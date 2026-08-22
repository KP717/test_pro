

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_pro/core/routes/route_constant.dart';
import 'package:test_pro/core/usecases/usercases.dart';
import 'package:test_pro/dependency_injection/injection_container.dart';
import 'package:test_pro/features/splash/domain/usecases/validate_login_usecase.dart';

import '../../../../core/storage/preference_manager.dart';

abstract class SplashScreenState{}

class SplashScreenInitialState extends SplashScreenState{}
class SplashScreenInitializingState extends SplashScreenState{}
class SplashScreenInitializedState extends SplashScreenState{}

class SplashScreenErrorState extends SplashScreenState{
  String message;
  SplashScreenErrorState(this.message);
}

abstract class SplashScreenEvent{}

class InitializeDefaultsEvent extends SplashScreenEvent{}

class ValidateLoginEvent extends SplashScreenEvent{
  BuildContext context;
  ValidateLoginEvent(this.context);
}


class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState>{


  SplashScreenBloc():super(SplashScreenInitialState()){

      on<InitializeDefaultsEvent>((event,emit)async{
        emit(SplashScreenInitializingState());
        await PreferenceManager.init();
        emit(SplashScreenInitializedState());
      });

      on<ValidateLoginEvent>((event, emit)async{

        var result = await getIt<ValidateLoginUsecase>().call(NoParams());

        result.fold((exception){
          emit(SplashScreenErrorState(exception.toString()));
        }, (isLoggedIn){
            event.context.go(isLoggedIn ? RouteConstant.postsScreen : RouteConstant.loginScreen);
        });

      });
  }

}