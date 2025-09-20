import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindease_app/Menus/Breathing%20Menus/calm.dart';
import 'package:slide_to_act/slide_to_act.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  String Greetings() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning☀️";
    } else if (hour < 17) {
      return "Good Afternoon🌤️";
    } else {
      return "Good Evening🌙";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          // Gradient Header Background
          Container(
            height: 400,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFC3DEDC), Color(0x0fffffff)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(70)),
            ),
          ),

          // Content Overlay
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildGreetingSection(),
                    const SizedBox(height: 20),
                    _buildCalendarStrip(),
                    const SizedBox(height: 8),
                    _buildMoodTracker(),
                    const SizedBox(height: 20),
                    _buildMotivationalQuote(),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(child: _buildBreathingSessionCard()),
                        const SizedBox(width: 18),
                        Expanded(child: _buildJournalEntryCard()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Greeting Section
  Widget _buildGreetingSection() {
    String username = user?.displayName ?? "User";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Greetings(),
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            Row(
              children: [
                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'inter',
                  ),
                ),
                const Text("👋🏽", style: TextStyle(fontSize: 22)),
              ],
            ),
          ],
        ),
        IconButton(
          icon: const Icon(
            Icons.notifications_none,
            size: 30,
            color: Colors.black,
          ),
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

    return SizedBox(
      height: 120, // Increased from 103 to 120
      child: ListView(
        scrollDirection: Axis.horizontal,
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
                                ? const Color(0xFF008080)
                                : const Color(0xFF98C9C8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
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
                    const SizedBox(height: 5),
                    Text(
                      item['emoji'] as String,
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }

  /// Mood Tracker
  Widget _buildMoodTracker() {
    final moods = [
      {'emoji': '😊', 'label': 'Happy'},
      {'emoji': '😐', 'label': 'Neutral'},
      {'emoji': '😢', 'label': 'Sad'},
      {'emoji': '😰', 'label': 'Anxious'},
      {'emoji': '😠', 'label': 'Angry'},
      {'emoji': '🤩', 'label': 'Excited'},
      {'emoji': '🥱', 'label': 'Tired'},
      {'emoji': '😴', 'label': 'Sleepy'},
      {'emoji': '🤔', 'label': 'Thinking'},
      {'emoji': '😎', 'label': 'Confident'},
      {'emoji': '😭', 'label': 'Crying'},
      {'emoji': '🤯', 'label': 'Overwhelmed'},
      {'emoji': '😇', 'label': 'Blessed'},
      {'emoji': '🤒', 'label': 'Sick'},
      {'emoji': '😋', 'label': 'Playful'},
      {'emoji': '😍', 'label': 'In Love'},
      {'emoji': '😤', 'label': 'Frustrated'},
      {'emoji': '😳', 'label': 'Embarrassed'},
      {'emoji': '🥳', 'label': 'Celebrating'},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "How are you feeling today?",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: 'inter',
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 90,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children:
                moods.map((mood) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          mood['emoji'] as String,
                          style: const TextStyle(fontSize: 36),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          mood['label']!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
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

  /// Motivational Quote
  Widget _buildMotivationalQuote() {
    return Padding(
      padding: const EdgeInsets.only(top: 20), // Moves the card 20px down
      child: Container(
        padding: const EdgeInsets.all(15),
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
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'inter',
              ),
            ),
            SizedBox(height: 8),
            Text(
              "\"Every day may not be good, but there’s something good in every day.\"",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontFamily: 'inter',
              ),
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
      ),
    );
  }

  /// Breathing Session Card
  Widget _buildBreathingSessionCard() {
    return SizedBox(
      width: 50,
      height: 190,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.teal.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.self_improvement, size: 40, color: Colors.teal),
            const SizedBox(height: 8),
            const Text("Need A Minute to Relax?", textAlign: TextAlign.center),
            const SizedBox(height: 12),
            SizedBox(
              height: 50,

              child: SlideAction(
                borderRadius: 30,
                innerColor: Colors.teal,
                outerColor: Colors.teal.withOpacity(0.2),
                text: "Breathing Session",
                textStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontFamily: 'inter',
                ),
                sliderButtonIconSize: 12,
                onSubmit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Calm()),
                  );
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Journal Entry Card
  Widget _buildJournalEntryCard() {
    return SizedBox(
      width: 50,
      height: 190,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.purple.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Write a quick\nJournal Entry",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'inter',
              ),
            ),
            SizedBox(height: 12),
            Icon(Icons.add_circle, size: 40, color: Colors.teal),
          ],
        ),
      ),
    );
  }
}


