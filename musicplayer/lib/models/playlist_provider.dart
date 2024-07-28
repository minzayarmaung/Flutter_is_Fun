import 'package:audioplayers/audioplayers.dart';
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
        audioPath:
            "https://drive.usercontent.google.com/download?id=10xNRWWc6_mQpVMyyOJ7SERslccYAg4eL&export=download&authuser=1&confirm=t&uuid=36b2d847-580d-4cce-aec1-07d31a96e4da&at=APZUnTXfJw7w5AR9cq4pzuv8KCBb:1722175644734"),
    // Song 2
    Song(
        songName: "Cruel Summer",
        artistName: "Taylor Swift",
        albumArtImagePath: "assets/images/taylorswift.jpeg",
        audioPath:
            "https://drive.usercontent.google.com/download?id=1NJQ0IN0DIK7QxWvd_3bXj9z3-QAH9-oZ&export=download&authuser=1&confirm=t&uuid=e8ecb3e9-b736-4eeb-b598-b3ca9a4962c1&at=APZUnTUzSGI-sBTk-GX4ax1zXSgi:1722181306999"),
    // Song 3
    Song(
        songName: "Heaven Sent",
        artistName: "Tevomxntana",
        albumArtImagePath: "assets/images/heavensent.jpg",
        audioPath:
            "https://drive.usercontent.google.com/download?id=1nGrzyIwBlZbsKWXa0NT9dSe2bZ5Br8Oz&export=download&authuser=1&confirm=t&uuid=ea7817bb-f09d-4f2b-be67-f6d1fe3b0cdd&at=APZUnTUStyO_7gu-qoaoOOB-ItUh:1722181082055"),

    // Song 4
    Song(
        songName: "Fortnight",
        artistName: "Taylor Swift",
        albumArtImagePath: "assets/images/taylor.jpg",
        audioPath:
            "https://drive.usercontent.google.com/download?id=1CQcckYxCP5lI3oXxOEhJ5W9ZVyzFowwk&export=download&authuser=1&confirm=t&uuid=d740f894-e399-4911-b30c-93eb7b9ba8cf&at=APZUnTVTEBrVOc04Xbw3HpAep4XJ:1722181450259"),
    // Song 5
    Song(
        songName: "On MelancholyHill",
        artistName: "Godrillaz",
        albumArtImagePath: "assets/images/OnMelancholyHill.jpeg",
        audioPath:
            "https://drive.usercontent.google.com/download?id=1IYe8ec0RCJ7jEoUzSoXJhBz6XGyaUV4g&export=download&authuser=1&confirm=t&uuid=103014c0-2f41-41f8-8870-6068033991cd&at=APZUnTXiNd7yTu4ioFaAShI7vvX_:1722181158807"),
  ];

  // Current Song Playing Index
  int? _currentSongIndex = 0;

  /*
  Audio Player
  */

  // audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Duration
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // constructor
  PlaylistProvider() {
    listenToDuration();
    play();
  }

  // initially not playing
  bool _isPlaying = false;

  // play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    //  String audioPath =
    // 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-15.mp3';
    await _audioPlayer.stop();
    await _audioPlayer.play(UrlSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  // pause the song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // resume the song
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
    _currentDuration = position;
    notifyListeners();
  }

  // play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        currentSongIndex = currentSongIndex! + 1;
      } else {
        // if reached the end of the playlist, reset to the first song
        currentSongIndex = 0;
      }
    }
    play(); // Add this line to start playing the next song
    notifyListeners();
  }

  // play previous song
  void playPreviousSong() async {
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      if (_currentDuration.inSeconds > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        currentSongIndex = _playlist.length - 1;
      }
      play();
      notifyListeners();
    }
  }

  // listen to the duration
  void listenToDuration() {
    // listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    // listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    // listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  // dispose the audio player
  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  /*
  G E T T E R S 
  */

  List<Song> get playList => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  /*
  S E T T E R S 
  */
  set currentSongIndex(int? newIndex) {
    // update the currentSongIndex
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play();
    }

    //Update UI
    notifyListeners();
  }
}
