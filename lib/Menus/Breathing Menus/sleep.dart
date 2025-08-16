import 'package:flutter/material.dart';

class Sleep extends StatefulWidget {
  const Sleep({super.key});

  @override
  State<Sleep> createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFCFCFFF), Color(0xFFA3A3F5)],
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
        'Sleep',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2A3261),
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
          color: Color(0xFF2A3261),
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
            label: Text('5:00', style: TextStyle(color: Color(0xFF2A3261))),
            icon: Icon(Icons.timer, size: 20, color: Color(0xFF2A3261)),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: BorderSide(color: Color(0xFF2A3261), width: 2),
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
          label: Text('7:00', style: TextStyle(color: Color(0xFF2A3261))),
          icon: Icon(Icons.timer, size: 20, color: Color(0xFF2A3261)),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            side: BorderSide(color: Color(0xFF2A3261), width: 2),
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
          icon: Icon(Icons.timer, size: 20, color: Color(0xFF2A3261)),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            side: BorderSide(color: Color(0xFF2A3261), width: 2),
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
              fontSize: 20,
              color: Color(0xFF2A3261),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
