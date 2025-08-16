import 'package:flutter/material.dart';

class focus extends StatefulWidget {
  const focus({super.key});

  @override
  State<focus> createState() => _focusState();
}

class _focusState extends State<focus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFF4C1), Color(0xFFFFFFFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
