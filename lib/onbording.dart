import 'package:flutter/material.dart';
import 'package:myapp/MyHomePage.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
          ElevatedButton(onPressed: (){
            Navigator.pushAndRemoveUntil(
              context,
             MaterialPageRoute(builder: (context)=>const MyHomePage()),
             (route) => false);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32)
            ),
            padding:const EdgeInsets.symmetric( vertical:16,horizontal: 32 )
          ),
           child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Get Started',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              ),
              SizedBox(width: 8,),
              Icon( Icons.arrow_forward),
            
            ],
           )
           )
          
        
        ],),
      ),
    );
  }
}