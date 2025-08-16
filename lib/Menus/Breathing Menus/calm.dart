import 'package:flutter/material.dart';

class Calm extends StatefulWidget {
  const Calm({super.key});

  @override
  State<Calm> createState() => _CalmState();
}

class _CalmState extends State<Calm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFC3DEDC),
                  Color(0xFFE1D5FF),
                  Color(0xFFFFFFFF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          SafeArea(child: Column(children: [header(), timer()])),
        ],
      ),
    );
  }
}

Widget header() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Calm Breathing',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget music() {
  return Scaffold();
}

Widget timer() {
  return Row(
    children: [
      SizedBox(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text('5:00'),
        ),
      ),
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(),
        child: Text('10:00'),
      ),
    ],
  );
}
