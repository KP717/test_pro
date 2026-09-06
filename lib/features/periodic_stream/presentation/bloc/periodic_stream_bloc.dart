



import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class PeriodicStreamState {
  int count;
  PeriodicStreamState(this.count);
}

class PeriodicStreamCubit extends Cubit<PeriodicStreamState>{

  Timer? timer;

  PeriodicStreamCubit():super(PeriodicStreamState(0));

  void startPeriodicStream({int? resumeCount}){
    timer = Timer.periodic(const Duration(seconds: 1), (timer){
      emit(PeriodicStreamState((resumeCount ?? 0) + timer.tick));
    });
  }

  void pause(){
    try{
      timer?.cancel();

    }catch(_){}
  }

  void resume(){
    try{
      startPeriodicStream(resumeCount: state.count);
    }catch(_){}
  }

}