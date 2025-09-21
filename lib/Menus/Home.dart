import 'package:flutter/material.dart';
import 'Tabs/Calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _activeDate = DateTime.now().day;
  Map<int, String> _dateMoods = {};

  @override
  void initState() {
    super.initState();
    final today = DateTime.now().day;
    final calendarDates = [15, 16, 17, 18, 19, 20, 21];
    if (calendarDates.contains(today)) {
      _activeDate = today;
    } else {
      _activeDate = calendarDates.first;
    }
    _loadMoods();
  }

  Future<void> _loadMoods() async {
    final prefs = await SharedPreferences.getInstance();
    final moodsString = prefs.getString('dateMoods');
    if (moodsString != null) {
      final decoded = jsonDecode(moodsString) as Map<String, dynamic>;
      setState(() {
        _dateMoods = decoded.map(
          (key, value) => MapEntry(int.parse(key), value as String),
        );
      });
    }
  }

  Future<void> _saveMoods() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(
      _dateMoods.map((key, value) => MapEntry(key.toString(), value)),
    );
    await prefs.setString('dateMoods', encoded);
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
                colors: [Color(0xFF008080), Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(70)),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
        ],
      ),
    );
  }

  /// Greeting Section
  Widget _buildGreetingSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "☀️ Good Morning",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Row(
              children: const [
                SizedBox(width: 26),
                Text(
                  "Bapama ",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'inter',
                  ),
                ),
                Text("👋🏽", style: TextStyle(fontSize: 22)),
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.calendar_today,
                size: 28,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Calendar()),
                );
              },
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
        ),
      ],
    );
  }

  /// Calendar Strip
  Widget _buildCalendarStrip() {
    final dates = [
      {'day': 'Mon', 'date': 15},
      {'day': 'Tue', 'date': 16},
      {'day': 'Wed', 'date': 17},
      {'day': 'Thu', 'date': 18},
      {'day': 'Fri', 'date': 19},
      {'day': 'Sat', 'date': 20},
      {'day': 'Sun', 'date': 21},
    ];

    return SizedBox(
      height: 103,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:
            dates.map((item) {
              int date = item['date'] as int;
              bool isSelected = date == _activeDate;
              String emoji = _dateMoods[date] ?? '';
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: GestureDetector(
                  onTap: () async {
                    setState(() {
                      _activeDate = date;
                    });
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Calendar()),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? const Color(0xFF008080)
                                  : Colors.white.withOpacity(0.3),
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
                              "$date",
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
                      Text(emoji, style: const TextStyle(fontSize: 22)),
                    ],
                  ),
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
                    child: GestureDetector(
                      onTap: () async {
                        setState(() {
                          _dateMoods[_activeDate] = mood['emoji']!;
                        });
                        await _saveMoods();
                      },
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
    return Container(
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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            onPressed: () {},
            child: const Text(
              "breathing session",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontFamily: 'inter',
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Journal Entry Card
  Widget _buildJournalEntryCard() {
    return Container(
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
    );
  }
}
