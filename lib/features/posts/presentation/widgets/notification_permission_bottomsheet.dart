


import 'package:flutter/material.dart';
import 'package:test_pro/features/posts/presentation/controllers/notification_permission_controller.dart';

class NotificationPermissionBottomsheet extends StatefulWidget {
  final Route bottomsheetRoute;

  const NotificationPermissionBottomsheet({super.key, required this.bottomsheetRoute});

  @override
  State<NotificationPermissionBottomsheet> createState() => _NotificationPermissionBottomsheetState();
}

class _NotificationPermissionBottomsheetState extends State<NotificationPermissionBottomsheet> {


  late NotificationPermissionController _controller;

  @override
  void initState() {
    _controller = NotificationPermissionController(context, widget.bottomsheetRoute);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    
    return Container(
      height:MediaQuery.of(context).size.height * .5,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
      decoration: BoxDecoration(color: Colors.purple.shade800, borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications,color: Colors.white,size: 120,),
          const SizedBox(height: 24,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Get Notified", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),),
              Text(
                "Enable push notification to get updated about all our new products.", 
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 24,),
          SizedBox(width: double.infinity,
            child: ElevatedButton(
              onPressed: _controller.askNotificationPermission, 
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade900),
              child: Text("Enable",style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800),)
            ),
          )

        ],
      ),
    );
  }
}