import 'package:flutter/material.dart';
import 'package:mindease_app/Menus/Tabs/ChangePassword.dart';
import 'package:mindease_app/Menus/Tabs/Notifications.dart';
// Ensure the ChangePassword.dart file contains a class named ChangePasswordScreen

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SizedBox.expand(
        child: Stack(
          children: [
            // Gradient Background
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF008080), Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  // Header
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'User Profile',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'inter',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  Center(
                    child: CircleAvatar(
                      radius: 60,

                      child: CircleAvatar(
                        radius: 56,
                        backgroundImage: AssetImage('assets/profile.jpg'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Name
                  const Center(
                    child: Text(
                      'Bapama',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // Email
                  const Center(
                    child: Text(
                      'manuelbapama@gmail.com',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'inter',
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 2,
                      child: Column(
                        children: [
                          _profileOption(
                            icon: Icons.security,
                            text: 'Change Password',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ChangePassword(),
                                ),
                              );
                            },
                          ),
                          _divider(),
                          _profileOption(
                            icon: Icons.notifications,
                            text: 'Notifications',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Notifications(),
                                ),
                              );
                            },
                          ),
                          _divider(),
                          _profileOption(
                            icon: Icons.info_outline,
                            text: 'About Us',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileOption({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF2C3E50)),
      title: Text(text, style: TextStyle(fontWeight: FontWeight.w500)),
      trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black),
      onTap: onTap,
    );
  }

  Widget _divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Divider(height: 1),
    );
  }
}
