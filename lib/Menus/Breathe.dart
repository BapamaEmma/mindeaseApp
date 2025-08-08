import 'package:flutter/material.dart';
import 'package:mindease_app/Menus/Tabs/Breathing.dart';
import 'package:mindease_app/Menus/Tabs/Motivation.dart';

class Breathe extends StatefulWidget {
  const Breathe({super.key});

  @override
  State<Breathe> createState() => _BreathingState();
}

class _BreathingState extends State<Breathe> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey, width: 0.5),
                ),
                child: TabBar(
                  tabs: [Tab(text: 'Breathing'), Tab(text: 'Motivation')],
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  labelStyle: const TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.normal,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: EdgeInsets.zero,
                  indicator: BoxDecoration(
                    color: const Color(0xFF98C9C8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  dividerColor: Colors.transparent,
                ),
              ),
            ),
            Expanded(child: TabBarView(children: [Breathing(), Motivation()])),
          ],
        ),
      ),
    );
  }
}
