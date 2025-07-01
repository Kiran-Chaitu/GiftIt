import 'package:flutter/material.dart';

class RedirectionButttonsWithText extends StatelessWidget {
  final GestureTapCallback onTap;
  final String text;
  final double width,height;
  final Color buttonColor;
  const RedirectionButttonsWithText({
    super.key,
    required this.onTap,
    required this.text,
    required this.width,
    required this.height,
    this.buttonColor = Colors.white ,
    });

  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: onTap,
      child:
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(6, 6), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Text(
              text,
              //need to be 
              style:TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              // style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              //       color: Colors.black,
              //       fontWeight: FontWeight.bold,
              //     ),
            ),
          ),
        ) 
      ,
    );
  }
}