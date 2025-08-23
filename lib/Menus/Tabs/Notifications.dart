import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool dailyCheckIn = false;
  bool motivationalQuote = false;
  bool breathingSession = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontSize: 28,
            fontFamily: 'inter',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF008080), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32), // Remove the title from the body
                _notificationTile(
                  title: 'Daily Check in Reminders',
                  subtitle:
                      'Toggle the button to receive Daily check in Reminders',
                  value: dailyCheckIn,
                  onChanged: (val) => setState(() => dailyCheckIn = val),
                ),
                const SizedBox(height: 16),
                _notificationTile(
                  title: 'Motivational Quote Alert',
                  subtitle: 'Receive Alerts on Motivational Quotes',
                  value: motivationalQuote,
                  onChanged: (val) => setState(() => motivationalQuote = val),
                ),
                const SizedBox(height: 16),
                _notificationTile(
                  title: 'Breathing Session Reminders',
                  subtitle: 'Set Reminders for breathing session',
                  value: breathingSession,
                  onChanged: (val) => setState(() => breathingSession = val),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _notificationTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeThumbColor: Colors.black,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.black26,
        ),
      ],
    );
  }
}
