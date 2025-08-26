import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mindease_app/Models/playlist_provider.dart';
import 'package:mindease_app/Models/song.dart';
import 'package:provider/provider.dart';

class Calm extends StatefulWidget {
  const Calm({super.key});

  @override
  State<Calm> createState() => _CalmState();
}

class _CalmState extends State<Calm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xfffc3dedc),
                  Color(0xFFE1D5FF),
                  Color(0xFFFFFFFF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 30),
                header(),
                title(),
                _activesong(context),
                timer(),
                SizedBox(height: 50),
                animation(),
                SizedBox(height: 10),
                breathinganimation(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget header() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Calm Breathing',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2C3E50),
        ),
      ),
    ),
  );
}

// Widget music() {
//   return Scaffold();
// }

Widget title() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Select Duration',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF2C3E50),
        ),
      ),
    ),
  );
}

Widget timer() {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 120,
          height: 50,
          child: OutlinedButton.icon(
            onPressed: () {},
            label: Text('5:00'),
            icon: Icon(Icons.timer, size: 20, color: Color(0xFF2C3E50)),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: BorderSide(color: Color(0xFF2C3E50), width: 2),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ),

      SizedBox(width: 12), // Space between buttons
      SizedBox(
        width: 120,
        height: 50,
        child: OutlinedButton.icon(
          onPressed: () {},
          label: Text('7:00'),
          icon: Icon(Icons.timer, size: 20, color: Color(0xFF2C3E50)),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            side: BorderSide(color: Color(0xFF2C3E50), width: 2),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      SizedBox(width: 12), // Space between buttons
      SizedBox(
        width: 120,
        height: 50,
        child: OutlinedButton.icon(
          onPressed: () {},
          label: Text('10:00'),
          icon: Icon(Icons.timer, size: 20, color: Color(0xFF2C3E50)),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            side: BorderSide(color: Color(0xFF2C3E50), width: 2),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    ],
  );
}

Widget _activesong(BuildContext context) {
  return Builder(
    builder: (context) {
      return ListTile(
        leading: Image.asset('assets/images/music_note.png'),
        // title: Text(song.name),
        onTap: () {
          showPlaylistBottomSheet(context);
        },
      );
    },
  );
}

Widget animation() {
  return Container(
    child: Column(
      children: [
        Center(
          child: Text(
            'Unwind Your thoughts and find peace',
            style: TextStyle(
              color: Color(0xFF2C3E50),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

void showPlaylistBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            // Handle bar
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            // Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Playlist',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // Playlist content
            Expanded(
              child: Consumer<PlaylistProvider>(
                builder: (context, value, child) {
                  final List<Song> playlist = value.playlist;
                  return ListView.builder(
                    itemCount: playlist.length,
                    itemBuilder: (context, index) {
                      final Song song = playlist[index];
                      return ListTile(
                        leading: Image.asset('assets/images/music_note.png'),
                        title: Text(song.songName),
                        subtitle: Text(song.artistName),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget breathinganimation() {
  return Stack(
    alignment: Alignment.center,
    children: [
      Center(child: Lottie.asset('assets/Animations/Breathing.json')),
      Positioned(
        top: 185,
        child: Text(
          'Breathe',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
