


import 'package:flutter/material.dart';
import 'package:test_pro/features/chat/controller/chat_screen_controller.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  late ChatScreenController _controller;

  @override
  void initState() {
    _controller = ChatScreenController()..init(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(title: Text("Chat"),),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ValueListenableBuilder(
                  valueListenable: _controller.messageValueNotifier,
                  builder: (context,messageList, child){

                if(messageList.isEmpty){
                  return Text("No Messages yet");
                }

                return ListView.builder(
                  itemCount: messageList.length,
                    itemBuilder: (context,index){
                      Map<String,String> message = messageList[index];
                      bool isYou = message.containsKey("You");

                      return Row(mainAxisAlignment: isYou? MainAxisAlignment.end : MainAxisAlignment.start,
                        children: [
                          Container(
                              constraints: BoxConstraints(minWidth: 120),
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                              decoration: BoxDecoration(color:isYou ? Colors.green : Colors.red, borderRadius: BorderRadius.circular(4)),
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: Text(isYou ? message["You"].toString() : message["Server"].toString(),
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),)),
                        ],
                      );
                    }
                );

              }),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(flex: 8,
                  child: SizedBox(height: 48,
                    child: ValueListenableBuilder(valueListenable: _controller.sendMessageValueNotifier, builder: (context,controller, child){
                      return TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                            hint: Text("Send Message...",style: TextStyle(color: Colors.grey),),
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1),borderRadius: BorderRadius.circular(8))
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(width: 4,),
                Flexible(flex: 3,
                  child: SizedBox(height: 48,
                    child: ElevatedButton(
                        onPressed:_controller.sendData,
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade900, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                        child: Text("Send",style: TextStyle(color: Colors.white),)
                    ),
                  ),
                ),
            ],),
          ),

        ],),
      ),
    );
  }
}
