import 'package:flutter/material.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        const Column(
          children: [
            Text(
              'Your AI assistent',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),),

              SizedBox(height: 16,),
        Text(
          'Using this applction you can chat with your AI assistant and generate arlticles.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black54,
        ),
        )
          ],
        ),
        const SizedBox(height: 32,),
        Image.asset('assets/onboarding.png'),
        const SizedBox(height: 32,),
        
      
      ],),
    );
  }
}