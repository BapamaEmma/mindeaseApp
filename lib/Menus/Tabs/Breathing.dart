import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mindease_app/Menus/Breathing%20Menus/calm.dart';
import 'package:mindease_app/Menus/Breathing%20Menus/focus.dart';
import 'package:mindease_app/Menus/Breathing%20Menus/sleep.dart';
import 'package:slide_to_act/slide_to_act.dart';

class Breathing extends StatefulWidget {
  const Breathing({super.key});

  @override
  State<Breathing> createState() => _BreathingState();
}

class _BreathingState extends State<Breathing> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _header(),
          _Calm(context),
          SizedBox(height: 15),
          _focus(context),
          SizedBox(height: 15),
          _Sleep(context),
        ],
      ),
    );
  }
}

Widget _header() {
  return ListTile(
    title: Text(
      'Lets breathe Together',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    subtitle: Text('Swipe and follow the Flow'),
  );
}

Widget _Calm(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(
        colors: [Color(0xFFC1F0F6), Color(0xFFDCF6E9)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    width: 380,
    height: 160,
    child: Stack(
      children: [
        Positioned(
          top: -5,
          right: -17,
          child: Icon(Icons.eco, size: 120, color: Colors.green.shade200),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Calm',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Unwind your thoughts and find peace.',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 7,
          child: SizedBox(
            height: 50,
            child: Center(
              child: SlideAction(
                onSubmit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Calm()),
                  );
                },
                outerColor: Colors.white,
                innerColor: Color(0xFF008080),
                textColor: Color(0xFF008080),
                text: 'Swipe to start',
                textStyle: TextStyle(fontSize: 13),
                sliderButtonIconSize: 16,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _focus(context) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(
        colors: [Color(0xFFFFF4C1), Color(0xFFDCF6E9)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    width: 380,
    height: 160,
    child: Stack(
      children: [
        Positioned(
          top: 10,
          right: 17,
          child: Icon(
            FontAwesomeIcons.bullseye,
            size: 80,
            color: Colors.redAccent.shade100,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Focus',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Sharpen Your mind and stay Present',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 7,
          child: SizedBox(
            height: 50,
            child: Center(
              child: SlideAction(
                onSubmit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => focus()),
                  );
                },
                outerColor: Colors.white,
                innerColor: Color(0xFF008080),
                textColor: Color(0xFF008080),
                text: 'Swipe to start',
                textStyle: TextStyle(fontSize: 13),
                sliderButtonIconSize: 16,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _Sleep(context) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        colors: [Color(0xFFCFCFFF), Color(0xFFA3A3F5)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    width: 380,
    height: 160,
    child: Stack(
      children: [
        Positioned(
          top: 10,
          right: 17,
          child: Icon(
            FontAwesomeIcons.moon,
            size: 80,
            color: Color(0xFFFFB92E),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Sleep',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Ease into deep rest with Mindful Breathing'),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 7,
          child: SizedBox(
            height: 50,
            child: Center(
              child: SlideAction(
                onSubmit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Sleep()),
                  );
                },
                outerColor: Colors.white,
                innerColor: Color(0xFF008080),
                textColor: Color(0xFF008080),
                text: 'Swipe to start',
                textStyle: TextStyle(fontSize: 13),
                sliderButtonIconSize: 16,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
