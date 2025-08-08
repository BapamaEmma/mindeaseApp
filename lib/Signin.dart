// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:mindease_app/Menus/Home.dart';
import 'package:mindease_app/Welcome.dart';
import 'package:mindease_app/signup.dart'; // ✅ Import your signup page

// Custom slide transition
class SlideFromBottomPageRoute extends PageRouteBuilder {
  final Widget page;
  SlideFromBottomPageRoute({required this.page})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
}

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Signin',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'inter',
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              SlideFromBottomPageRoute(page: const Welcome()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        // ✅ Makes the form scrollable
        padding: const EdgeInsets.all(20.0),
        child: _signInForm(),
      ),
    );
  }

  Widget _signInForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _welcomeBack(),
        const SizedBox(height: 20),
        TextField(decoration: _inputDecoration('Email')),
        const SizedBox(height: 30),
        TextField(
          obscureText: _obscureText,
          decoration: _inputDecoration('Password').copyWith(
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              SlideFromBottomPageRoute(page: const Home()),
            );
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: const Color(0xFF008080),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'inter',
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Don\'t have an Account?',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: 'inter',
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  SlideFromBottomPageRoute(page: Signup()), // ✅ Go to Signup
                );
              },
              child: const Text(
                'Signup',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF008080),
                  fontFamily: 'inter',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: const [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Or'),
            ),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 20),
        OutlinedButton.icon(
          icon: Image.asset(
            'assets/images/goog_icon.png',
            height: 40,
            width: 40,
          ),
          label: const Text(
            'Continue with Google',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'inter',
            ),
          ),
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            side: const BorderSide(color: Colors.black, width: 0.3),
          ),
        ),
      ],
    );
  }

  Widget _welcomeBack() {
    return const Text(
      'Welcome Back',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: 'inter',
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontFamily: 'inter',
      ),
      floatingLabelStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontFamily: 'Inter',
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.black, width: 0.3),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.black, width: 0.3),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.black, width: 0.3),
      ),
    );
  }
}
