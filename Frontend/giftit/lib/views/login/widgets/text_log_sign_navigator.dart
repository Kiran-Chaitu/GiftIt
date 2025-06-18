import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextLogSignNavigator extends StatelessWidget {
  final String text;
  final GestureTapCallback callBackFunction;
  const TextLogSignNavigator({
    super.key,
    required this.text,
    required this.callBackFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //need to change
        SizedBox(width: 200 ,),        
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