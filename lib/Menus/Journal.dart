import 'package:flutter/material.dart';

class Journal extends StatefulWidget {
  const Journal({super.key});

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
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
                colors: [Color(0xFFC3DEDC), Color(0xFFFFFFFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ), // Added horizontal padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Topsection(),
                    SizedBox(height: 10),
                    Streaks(),
                    SizedBox(height: 25),
                    journalnotes(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget Topsection() {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(
      'Journal',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
    subtitle: Text('You made it here - ready to reflect ?'),
    trailing: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
  );
}

Widget Streaks() {
  return Column(
    children: [
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          'Journal Streaks',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      SizedBox(height: 1),
      Row(
        children: [
          Column(
            children: [
              Text('Mon', style: TextStyle(color: Colors.grey, fontSize: 16)),
              Icon(Icons.check_circle, color: Colors.orange[800], size: 30),
            ],
          ),
          SizedBox(width: 25),
          Column(
            children: [
              Text('Tue', style: TextStyle(color: Colors.grey, fontSize: 16)),
              Icon(Icons.check_circle, color: Colors.green[800], size: 30),
            ],
          ),
          SizedBox(width: 25),
          Column(
            children: [
              Text('Wed', style: TextStyle(color: Colors.grey, fontSize: 16)),
              Icon(Icons.check_circle, color: Colors.green[800], size: 30),
            ],
          ),
          SizedBox(width: 25),
          Column(
            children: [
              Text('Thu', style: TextStyle(color: Colors.grey, fontSize: 16)),
              Icon(Icons.check_circle, color: Colors.orange[800], size: 30),
            ],
          ),
          SizedBox(width: 25),
          Column(
            children: [
              Text('Fri', style: TextStyle(color: Colors.grey, fontSize: 16)),
              Icon(Icons.check_circle, color: Colors.orange[800], size: 30),
            ],
          ),
          SizedBox(width: 25),
          Column(
            children: [
              Text('Sat', style: TextStyle(color: Colors.grey, fontSize: 16)),
              Icon(Icons.check_circle, color: Colors.orange[800], size: 30),
            ],
          ),
          SizedBox(width: 25),
          Column(
            children: [
              Text('Sun', style: TextStyle(color: Colors.grey, fontSize: 16)),
              Icon(Icons.check_circle, color: Colors.orange[800], size: 30),
            ],
          ),
        ],
      ),
    ],
  );
}

Widget journalnotes() {
  return SizedBox(
    height: 188,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            // offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Feeling Happy today',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 5),
            Text('Today has been a good day, a lot of things went well...'),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 280.0),
              child: Row(
                children: [
                  Text('Mood: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Icon(Icons.mood, color: Colors.orange),
                ],
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('12th June, 2024', style: TextStyle(color: Colors.grey)),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit, color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
