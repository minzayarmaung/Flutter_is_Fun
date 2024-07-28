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
        audioPath: "assets/audio/AboutYou.mp3"),
    // Song 2
    Song(
        songName: "CruelSummer",
        artistName: "Taylor Swift",
        albumArtImagePath: "assets/images/taylorswift.jpeg",
        audioPath: "assets/audio/cruelsummer.mp3"),
    // Song 3
    Song(
        songName: "Heaven Sent",
        artistName: "Tevomxntana",
        albumArtImagePath: "assets/images/heavensent.jpg",
        audioPath: "assets/audio/heavensent.mp3"),
    // Song 4
    Song(
        songName: "Fortnight",
        artistName: "Taylor Swift",
        albumArtImagePath: "assets/images/taylor.jpg",
        audioPath: "assets/audio/fortnight.mp3"),
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
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
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
  void seekTo(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // play next song
  void playNextSong() {
    if (_currentSongIndex! < _playlist.length - 1) {
      _currentSongIndex = currentSongIndex! + 1;
    } else {
      // if reached the end of the playlist, reset to the first song
      _currentSongIndex = 0;
    }
    play(); // Add this line to start playing the next song
    notifyListeners();
  }

  // play previous song
  void playPreviousSong() async {
    if (_currentDuration.inSeconds > 2) {
      seekTo(Duration.zero);
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
