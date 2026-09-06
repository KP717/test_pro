

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pro/features/periodic_stream/presentation/bloc/periodic_stream_bloc.dart';

class PeriodicStreamScreenController {

  late BuildContext context;

  late StreamSubscription<int> periodicStreamSubscription;
  late StreamController<int> periodicStreamController;


  void init({required BuildContext context}){
    this.context = context;
    // context.read<PeriodicStreamCubit>().startPeriodicStream();

    periodicStreamController = StreamController<int>();
    _startPeriodicStream();
  }

  void _startPeriodicStream(){
    Stream<int> timerStream = Stream.periodic(const Duration(seconds: 1), (count)=> count);

    periodicStreamSubscription = timerStream.listen((data){
      periodicStreamController.sink.add(data);
    });
  }


  void pauseStream(){
    try{
      periodicStreamSubscription.pause();
      // context.read<PeriodicStreamCubit>().pause();
    }catch(_){}
  }

  void resumeStream(){
    try{
      periodicStreamSubscription.resume();
      // context.read<PeriodicStreamCubit>().resume();

    }catch(_){}
  }


}