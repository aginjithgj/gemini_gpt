import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:myapp/message.dart';
//import 'package:myapp/themeNotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/themeNotifier.dart';

class MyHomePage extends ConsumerStatefulWidget {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:175168158.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2895448089.
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _message = [
    Message(text: "Hi", isUser: false),
  ];
  bool _isLoading = false;

  callGeminiModel() async {
    try {
      if (_controller.text.isNotEmpty) {
        _message.add(Message(text: _controller.text, isUser: true));
        _isLoading = true;
      }

      final model = GenerativeModel(
          model: 'gemini-pro', apiKey: dotenv.env["GOOGLE_API_KEY"]!);
      final prompt = _controller.text.trim();
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      setState(() {
        _message.add(Message(text: response.text!, isUser: false));
        _isLoading = false;
      });

      _controller.clear(); //may be not needed
    } catch (e) {
      if (kDebugMode) {
        print("Error : $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.read(themeProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/gpt-robot.png'),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Gemini GPT',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            GestureDetector(
              child: (currentTheme == ThemeMode.light)
                  ? Icon(
                      Icons.dark_mode,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : Icon(
                      Icons.light_mode,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              onTap: () {
                ref.read(themeProvider.notifier).toggleTheme();
              },
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _message.length,
                itemBuilder: (context, index) {
                  final message = _message[index];
                  return ListTile(
                    title: Align(
                      alignment: message.isUser
                          ? Alignment.topRight
                          : Alignment.topLeft,
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: message.isUser
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.secondary,
                              borderRadius: message.isUser
                                  ? const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20))
                                  : const BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                          child: Text(message.text,
                              style: message.isUser
                                  ? Theme.of(context).textTheme.bodyMedium
                                  : Theme.of(context).textTheme.bodySmall)),
                    ),
                  );
                }),
          ),
          //user input
          Padding(
            padding: const EdgeInsets.only(
                bottom: 32, top: 16.0, left: 16.0, right: 16),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3))
                  ]),
              //the input arrow starts here.
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: Theme.of(context).textTheme.titleSmall,
                      decoration: InputDecoration(
                          hintText: "Type a message",
                          hintStyle:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.grey,
                                  ),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20)),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  _isLoading
                      ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue, // Border color
                              width: 2.0, // Border width
                            ),
                            borderRadius: BorderRadius.circular(
                                8.0), // Border radius (optional)
                          ),
                          child: GestureDetector(
                            onTap: callGeminiModel,
                            child: Image.asset('assets/send.png'),
                          ),
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
