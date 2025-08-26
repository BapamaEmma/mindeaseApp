import 'package:flutter/material.dart';
import 'package:mindease_app/Models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> playlist = [
    Song(
      songName: 'Relaxing rain',
      artistName: 'Custom',
      albumImagePath: 'assets/images/music_note.png',
      audioPath: 'assets/Audio/Calm/relaxing-rain-387677.mp3',
    ),

    Song(
      songName: 'Lofi Chill',
      artistName: 'Custom',
      albumImagePath: 'assets/images/music_note.png',
      audioPath: 'assets/Audio/Calm/lofi-chill-background-music-313055.mp3',
    ),
  ];

  int? currentSongName;
}
