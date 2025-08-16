import 'package:flutter/material.dart';

class Sleep extends StatefulWidget {
  const Sleep({super.key});

  @override
  State<Sleep> createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFCFCFFF), Color(0xFFA3A3F5)],
        ),
      ),
    );
  }
}
