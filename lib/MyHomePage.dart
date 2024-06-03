import 'package:flutter/material.dart';
import 'package:myapp/message.dart';


class MyHomePage extends StatefulWidget {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:175168158.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2895448089.
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Message> _message = [
    Message(text: "Hi", isUser: true),
    Message(text: "Hello how are you?", isUser: false),
    Message(text: "Grate! you", isUser: true),
    Message(text: "I am fine", isUser: false),
  ];

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _message.length,
      itemBuilder: (contex,index){
      final  message = _message[index];
        return ListTile(
          title: Align(
            alignment: message.isUser ? Alignment.topRight : Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: message.isUser ? Colors.blue : Colors.grey[300],
                borderRadius: message.isUser ?
                 BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                ):
                 BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)
              )),
              child: Text(
                message.text,
                style: TextStyle(color: message.isUser ? Colors.white : Colors.black)
                )),
          ),
        );
      }
      ),
    );
  }

}


