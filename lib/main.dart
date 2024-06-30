import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/themeNotifier.dart';
import 'package:myapp/themes.dart';
import 'onbording.dart';
//import 'package:myapp/themeNotifier.dart';
//import 'package:myapp/themes.dart';
void main() async {
  await dotenv.load(fileName: ".env");
  
  runApp(
    ProviderScope(child: MyApp())
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});   

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: themeMode,
      // home: const MyHomePage(title: 'Welcome to Flutter! guys',),
      home: const Onbording(),
    );
  }
}
