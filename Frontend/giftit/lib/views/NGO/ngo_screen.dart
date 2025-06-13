import 'package:flutter/material.dart';

class NgoScreen extends StatefulWidget {
  const NgoScreen({super.key});

  @override
  State<NgoScreen> createState() => _NgoScreenState();
}

class _NgoScreenState extends State<NgoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('NGO\'s Screen')),
    );
  }
}
