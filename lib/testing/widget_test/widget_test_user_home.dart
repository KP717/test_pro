
import 'package:flutter/material.dart';
import 'package:test_pro/testing/widget_test/user.dart';

class WidgetTestUserHome extends StatefulWidget{

  final Future<List<User>> getUsers;
  const WidgetTestUserHome({super.key, required this.getUsers});
  
  @override
  State<StatefulWidget> createState() {
    return _UserHomeState();
  }
}

class _UserHomeState extends State<WidgetTestUserHome>{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Async Widget Testing"),),
      body:FutureBuilder(future: widget.getUsers, builder: (context, snapshot){

        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }

        if(snapshot.hasError){
          return Center(child: Text(key:const Key("error"),snapshot.error.toString()));
        }

        if((snapshot.data ?? []).isEmpty){
          return Center(key:const Key("no_data"),child: Text("No Data"));    
        }

        List<User> userList = (snapshot.data as List<User>);

        return ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index){
            User user = userList[index];

            return ListTile(title: Text(user.name.toString()), subtitle: Text(user.email.toString()),);
          }
        );
      })
    );
  }

}