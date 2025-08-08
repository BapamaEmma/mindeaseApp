// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:mindease_app/Signin.dart';
import 'package:mindease_app/Signup.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with TickerProviderStateMixin {
  late AnimationController _logoController;
  late Animation<Offset> _logoAnimation;
  late Animation<double> _logoFade;
  late Animation<double> _logoScale;

  late AnimationController _contentController;
  late Animation<Offset> _contentAnimation;

  @override
  void initState() {
    super.initState();

    // Logo animations
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    _logoAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _logoController, curve: Curves.easeOut));

    _logoFade = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _logoController, curve: Curves.easeIn));

    _logoScale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeOutBack),
    );

    // Content animations
    _contentController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _contentAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _contentController, curve: Curves.easeOut),
    );

    _logoController.forward();

    Future.delayed(const Duration(milliseconds: 400), () {
      _contentController.forward();
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Logo
          Positioned(
            top: 2,
            left: MediaQuery.of(context).size.width / 2 - 95,
            child: FadeTransition(
              opacity: _logoFade,
              child: ScaleTransition(
                scale: _logoScale,
                child: SlideTransition(
                  position: _logoAnimation,
                  child: _Logo(),
                ),
              ),
            ),
          ),

          // Illustration
          Positioned(
            top: 140,
            left: MediaQuery.of(context).size.width / 2 - 180,
            child: FadeTransition(
              opacity: _contentController,
              child: SlideTransition(
                position: _contentAnimation,
                child: _Illustration(),
              ),
            ),
          ),

          // Title
          Positioned(
            top: 450,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: FadeTransition(
              opacity: _contentController,
              child: SlideTransition(
                position: _contentAnimation,
                child: _Title(),
              ),
            ),
          ),

          // Buttons
          Positioned(
            top: 650,
            left: 0,
            right: 0,
            child: FadeTransition(
              opacity: _contentController,
              child: SlideTransition(
                position: _contentAnimation,
                child: _buildButtons(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Logo Widget ---
Widget _Logo() {
  return Hero(
    tag: 'app_logo',
    child: Image.asset(
      'assets/images/logo0.png',
      width: 190,
      height: 190,
      fit: BoxFit.cover,
    ),
  );
}

// --- Illustration Widget ---
Widget _Illustration() {
  return Image.asset(
    'assets/images/illustration.png',
    width: 360,
    height: 360,
    fit: BoxFit.cover,
  );
}

// --- Title Widget ---
Widget _Title() {
  return Column(
    children: const [
      Text(
        'Breathe. Reflect. Heal',
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 8),
      Text(
        textAlign: TextAlign.center,
        'Join a space designed to help you slow down, check in with yourself, and feel better every day.',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black54,
          fontFamily: 'Inter',
        ),
      ),
    ],
  );
}

// --- Buttons Widget ---
Widget _buildButtons(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, SlideFromBottomPageRoute(page: Signin()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF008080),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text(
            'Already have an account?',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Inter',
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, SlideFromBottomPageRoute(page: Signup()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: Colors.black, width: 0.3),
            ),
          ),
          child: const Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Inter',
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}

// --- Custom Page Transition ---
class SlideFromBottomPageRoute extends PageRouteBuilder {
  final Widget page;

  SlideFromBottomPageRoute({required this.page})
    : super(
        pageBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) => page,
        transitionDuration: const Duration(milliseconds: 600),
        transitionsBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) => SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              ),
              child: child,
            ),
      );
}
