import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ElevatedButton(onPressed: (), child: Text("Skip")),
          Container(
            child: Column(
              children: [
                Image(image: AssetImage('assets/Image1.png')),
                Text("Share your surplus, feed a soul -\n your food can be someone's hope today."),
              ],
            ),
          ),
          SizedBox(height: 20,),
          // ElevatedButton(onPressed: onPressed, child: Icon(Icons.arrow_forward))
        ],
      ),
    );
  }
}
