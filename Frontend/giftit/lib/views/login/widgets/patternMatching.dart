import 'package:flutter/material.dart';

bool patternMatchAndSnackBar(String regexStr,String checkStr, String snacText , BuildContext context){
    if(!RegExp(regexStr).hasMatch(checkStr)){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(snacText , style: TextStyle(color: Colors.red),))
      );
      return false;
    }
    return true;
  }