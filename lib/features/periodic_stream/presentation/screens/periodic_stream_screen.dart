

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pro/features/periodic_stream/controller/periodic_stream_screen_controller.dart';
import 'package:test_pro/features/periodic_stream/presentation/bloc/periodic_stream_bloc.dart';

class PeriodicStreamScreen extends StatefulWidget {
  const PeriodicStreamScreen({super.key});

  @override
  State<PeriodicStreamScreen> createState() => _PeriodicStreamScreenState();
}

class _PeriodicStreamScreenState extends State<PeriodicStreamScreen> {


  late PeriodicStreamScreenController _controller;

  TextStyle dataStyle = const TextStyle(color: Colors.black, fontSize: 180,fontWeight: FontWeight.w900);

  @override
  void initState() {
    _controller = PeriodicStreamScreenController()..init(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Periodic Stream Screen",style: TextStyle(fontSize: 20),),),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder(stream: _controller.periodicStreamController.stream,
                builder: (context, snapshot){
              return Text(snapshot.data.toString(),style: dataStyle);
            }),
            // BlocBuilder<PeriodicStreamCubit, PeriodicStreamState>(builder: (context,state){
            //   return Text(state.count.toString(),style: dataStyle);
            // }),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ConstrainedBox(constraints: BoxConstraints(minWidth: 120), child: ElevatedButton(onPressed: _controller.pauseStream,style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade900),
                    child: Text("Pause",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),),
                ConstrainedBox(constraints: BoxConstraints(minWidth: 120), child: ElevatedButton(onPressed: _controller.resumeStream,style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade900),
                    child: Text("Resume",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
