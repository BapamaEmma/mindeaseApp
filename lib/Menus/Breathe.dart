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
    return GradientScaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey, width: 0.5),
                  ),
                  child: TabBar(
                    tabs: const [
                      Tab(text: 'Breathing'),
                      Tab(text: 'Motivation'),
                    ],
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
                      color: const Color(0xFF98C9C8), // Light teal
                      borderRadius: BorderRadius.circular(15),
                    ),
                    dividerColor: Colors.transparent,
                  ),
                ),
              ),
              const Expanded(
                child: TabBarView(children: [Breathing(), Motivation()]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientScaffold extends StatelessWidget {
  final Widget body;
  final Widget? appBar;

  const GradientScaffold({Key? key, required this.body, this.appBar})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFC3DEDC), Color(0xFFFFFFFF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: body,
      ),
    );
  }
}
