import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextLogSignNavigator extends StatelessWidget {
  final String text,frontText;
  final GestureTapCallback callBackFunction;
  const TextLogSignNavigator({
    super.key,
    required this.text,
    required this.callBackFunction,
    this.frontText='',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //need to change
        // const SizedBox(width: 200 ,),        
        Container(
          width: 200,
          // alignment: Alignment.centerRight,
          child: Text(frontText,style: TextStyle(color: Colors.black),textAlign: TextAlign.right,),
        ),
        GestureDetector(
          onTap: callBackFunction,
          child: Text(
            text,
            style:TextStyle(
              color: Colors.blue,
            ),
          ),
        )
      ]
    );
  }
}