import 'package:flutter/material.dart';
import 'package:musicplayer/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  // playlist of Songs
  final List<Song> _playlist = [
    // Song 1
    Song(
        songName: "About You",
        artistName: "The 1975",
        albumArtImagePath: "assets/images/the1975.jpeg",
        audioPath: "assets/songs/AboutYou.mp3"),
    // Song 2
    Song(
        songName: "CruelSummer",
        artistName: "Taylor Swift",
        albumArtImagePath: "assets/images/taylorswift.jpeg",
        audioPath: "assets/songs/cruelsummer.mp3"),
    // Song 3
    Song(
        songName: "Heaven Sent",
        artistName: "Tevomxntana",
        albumArtImagePath: "assets/images/heavensent.jpg",
        audioPath: "assets/songs/heavensent.mp3"),
    // Song 4
    Song(
        songName: "Fortnight",
        artistName: "Taylor Swift",
        albumArtImagePath: "assets/images/taylor.jpg",
        audioPath: "assets/songs/fortnight.mp3"),
  ];

  // Current Song Playing Index
  int? _currentSongIndex;

  /*
  G E T T E R S 
  */

  List<Song> get playList => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  /*
  S E T T E R S 
  */
  set currentSongIndex(int? newIndex) {
    // update the currentSongIndex
    _currentSongIndex = newIndex;

    //Update UI
    notifyListeners();
  }
}
