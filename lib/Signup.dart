import 'package:flutter/material.dart';
import 'package:mindease_app/Menus/Home.dart';
import 'package:mindease_app/Signin.dart';
import 'package:mindease_app/Welcome.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Signup',
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(decoration: _inputDecoration('Name')),
              const SizedBox(height: 30),
              TextField(decoration: _inputDecoration('Age')),
              const SizedBox(height: 30),
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
                  'Signup',
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
                    'Already have an account?',
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
                        SlideFromBottomPageRoute(page: const Signin()),
                      );
                    },
                    child: const Text(
                      'Login',
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
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontFamily: 'Inter',
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

class SlideFromBottomPageRoute extends PageRouteBuilder {
  final Widget page;

  SlideFromBottomPageRoute({required this.page})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: Curves.easeInOut));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
}
