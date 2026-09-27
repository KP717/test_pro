

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatScreenController {


  late BuildContext context;

  late final WebSocketChannel webSocketChannel;
  late ValueNotifier<TextEditingController> sendMessageValueNotifier;
  late ValueNotifier<List<Map<String,String>>> messageValueNotifier;
  late StreamSubscription<dynamic> webSocketSubscription;


  void init({required BuildContext context}){
    this.context = context;
    webSocketChannel = WebSocketChannel.connect(Uri.parse('wss://ws.postman-echo.com/raw'));
    sendMessageValueNotifier = ValueNotifier(TextEditingController());
    messageValueNotifier = ValueNotifier<List<Map<String,String>>>([]);

    _listenToMessages();
  }


  void _listenToMessages(){
    webSocketSubscription = webSocketChannel.stream.listen((data){
      List<Map<String,String>> oldList = [...messageValueNotifier.value];
      oldList.add({"Server": data});
      messageValueNotifier.value = oldList;
    });
  }

  void sendData(){

    if(sendMessageValueNotifier.value.text.isEmpty){
      return;
    }
    webSocketChannel.sink.add(sendMessageValueNotifier.value.text);
    List<Map<String,String>> oldList = [...messageValueNotifier.value];
    oldList.add({"You": sendMessageValueNotifier.value.text});
    messageValueNotifier.value = oldList;

    sendMessageValueNotifier.value.clear();

  }

}