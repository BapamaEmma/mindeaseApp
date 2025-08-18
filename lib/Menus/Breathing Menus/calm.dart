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
                  Color(0xfffc3dedc),
                  Color(0xFFE1D5FF),
                  Color(0xFFFFFFFF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 30),
                header(),
                title(),
                timer(),
                SizedBox(height: 50),
                animation(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget header() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Calm Breathing',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2C3E50),
        ),
      ),
    ),
  );
}

// Widget music() {
//   return Scaffold();
// }

Widget title() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Select Duration',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF2C3E50),
        ),
      ),
    ),
  );
}

Widget timer() {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 120,
          height: 50,
          child: OutlinedButton.icon(
            onPressed: () {},
            label: Text('5:00'),
            icon: Icon(Icons.timer, size: 20, color: Color(0xFF2C3E50)),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: BorderSide(color: Color(0xFF2C3E50), width: 2),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ),

      SizedBox(width: 12), // Space between buttons
      SizedBox(
        width: 120,
        height: 50,
        child: OutlinedButton.icon(
          onPressed: () {},
          label: Text('7:00'),
          icon: Icon(Icons.timer, size: 20, color: Color(0xFF2C3E50)),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            side: BorderSide(color: Color(0xFF2C3E50), width: 2),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      SizedBox(width: 12), // Space between buttons
      SizedBox(
        width: 120,
        height: 50,
        child: OutlinedButton.icon(
          onPressed: () {},
          label: Text('10:00'),
          icon: Icon(Icons.timer, size: 20, color: Color(0xFF2C3E50)),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            side: BorderSide(color: Color(0xFF2C3E50), width: 2),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    ],
  );
}

Widget animation() {
  return Container(
    child: Column(
      children: [
        Center(
          child: Text(
            'Unwind Your thoughts and find peace',
            style: TextStyle(
              color: Color(0xFF2C3E50),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
