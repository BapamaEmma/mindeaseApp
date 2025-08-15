// ignore_for_file: dead_code

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[100]);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGreetingSection(),

              const SizedBox(height: 20),

              _buildCalendarStrip(),

              const SizedBox(height: 20),

              _buildMoodTracker(),

              const SizedBox(height: 24),

              _buildMotivationalQuote(),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _buildBreathingSessionCard()),
                  const SizedBox(width: 16),
                  Expanded(child: _buildJournalEntryCard()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Custom AppBar Section
  Widget _buildGreetingSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "☀️ Good Morning",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            Row(
              children: const [
                Text(
                  "Jeremiah ",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text("👋🏽", style: TextStyle(fontSize: 22)),
              ],
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.notifications_none, size: 30),
          onPressed: () {},
        ),
      ],
    );
  }

  /// Calendar Strip
  Widget _buildCalendarStrip() {
    final dates = [
      {'day': 'Sun', 'date': 21, 'emoji': '😊'},
      {'day': 'Mon', 'date': 22, 'emoji': '😡'},
      {'day': 'Tue', 'date': 23, 'emoji': ''},
      {'day': 'Wed', 'date': 24, 'emoji': ''},
      {'day': 'Thu', 'date': 25, 'emoji': ''},
      {'day': 'Fri', 'date': 26, 'emoji': ''},
      {'day': 'Sat', 'date': 27, 'emoji': ''},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            dates.map((item) {
              bool isSelected = item['date'] == 23;
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? Colors.teal
                                : Colors.teal.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                      child: Column(
                        children: [
                          Text(
                            item['day'] as String,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "${item['date']}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['emoji'] as String,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }

  /// Emoji Mood Tracker
  Widget _buildMoodTracker() {
    final moods = [
      {'emoji': '😊', 'label': 'Happy'},
      {'emoji': '😐', 'label': 'Neutral'},
      {'emoji': '😢', 'label': 'Sad'},
      {'emoji': '😰', 'label': 'Anxious'},
      {'emoji': '😠', 'label': 'Angry'},
      {'emoji': '🤩', 'label': 'Excited'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "How Are you feeling today ?",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                moods.map((mood) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Column(
                      children: [
                        Text(
                          mood['emoji']!,
                          style: const TextStyle(fontSize: 32),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          mood['label']!,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }

  /// Motivational Quote Section
  Widget _buildMotivationalQuote() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[50]!, Colors.purple[50]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Motivation",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "\"Every day may not be good, but there’s something good in every day.\"",
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "— Alice Morse Earle",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }

  /// Breathing Session Button
  Widget _buildBreathingSessionCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Icon(Icons.self_improvement, size: 40, color: Colors.teal),
          const SizedBox(height: 8),
          const Text("Need A Minute to Relax?", textAlign: TextAlign.center),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            onPressed: () {},
            child: const Text("breathing session"),
          ),
        ],
      ),
    );
  }

  /// Journal Entry Button
  Widget _buildJournalEntryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: const [
          Text(
            "Write a quick\nJournal Entry",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Icon(Icons.add_circle, size: 40, color: Colors.teal),
        ],
      ),
    );
  }
}
