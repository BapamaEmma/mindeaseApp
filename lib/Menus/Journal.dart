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
                padding: const EdgeInsets.symmetric(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [SizedBox(height: 20), Topsection()],
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
    title: Text(
      'Journal',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
    subtitle: Text('You made it here - ready to reflect ?'),
    trailing: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
  );
}

Widget Streaks() {
  return Container();
}
