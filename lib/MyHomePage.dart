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
  final TextEditingController _controller = TextEditingController();  
  final List<Message> _message = [
    Message(text: "Hi", isUser: true),
    Message(text: "Hello how are you?", isUser: false),
    Message(text: "Grate! you", isUser: true),
    Message(text: "I am fine", isUser: false),
  ];

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:false,
        backgroundColor: Colors.red,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/gpt-robot.png'),
                const Text('Gemini GPT',style: TextStyle(color: Colors.black),)
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _message.length,
            itemBuilder: (contex,index){
            final  message = _message[index];
              return ListTile(
                title: Align(
                  alignment: message.isUser ? Alignment.topRight : Alignment.topLeft,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: message.isUser ? Colors.blue : Colors.grey[300],
                      borderRadius: message.isUser ?
                       const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)
                      ):
                       const BorderRadius.only(
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
          ),
        //user input
        Padding(
          padding: const EdgeInsets.only(bottom: 32,top: 16.0,left:16.0,right:16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3)
                )
              ]
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller :_controller,
                    decoration: const InputDecoration(
                      hintText: "Type a message",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20)
                    ),
                  ),
                ),
                const SizedBox(width: 8,),
                    IconButton(onPressed: () {
            final text = _controller.text;
            setState(() {
              _message.insert(0, Message(text: text, isUser: true));
            });
            _controller.clear();
                    }, icon: const Icon(Icons.send, color: Colors.blue, size: 30,),
                    ),
              ],
            ),
          ),
        ),
        ],
      ),
    );
  }

}


