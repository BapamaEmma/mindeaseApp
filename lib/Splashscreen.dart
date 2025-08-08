import 'package:flutter/material.dart';
import 'package:mindease_app/Welcome.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _jumpAnimation;

  int _jumpCount = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _jumpAnimation = Tween<double>(begin: 0, end: -25)
      .chain(CurveTween(curve: Curves.easeOut))
      .animate(_controller)..addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(const Duration(milliseconds: 15));
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _jumpCount++;
        if (_jumpCount < 2) {
          await Future.delayed(const Duration(milliseconds: 001));
          _controller.forward();
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Welcome()),
          );
        }
      }
    });
    Future.delayed(const Duration(seconds: 1), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF008080),
      body: Center(
        child: AnimatedBuilder(
          animation: _jumpAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _jumpAnimation.value),
              child: child,
            );
          },
          child: Image.asset(
            'assets/images/Splashscreen Logo.png',
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
