import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/models/playlist_provider.dart';
import 'package:musicplayer/pages/neu_box.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder: (context, value, child) {
      // get PlayList
      final playlist = value.playList;

      // get Current Song Index
      final currentsong = playlist[value.currentSongIndex ?? 0];

      // Return Scaffold UI
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // appBar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // backbutton
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                    ),
                    //title
                    const Text("P L A Y L I S T "),

                    // Menu Button
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                    ),
                    //title
                  ],
                ),

                const SizedBox(height: 25),

                // album artwork
                NeuBox(
                  child: Column(
                    children: [
                      // Image
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(currentsong.albumArtImagePath)),

                      // Song and Artist
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //song and artist name
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentsong.songName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(currentsong.artistName),
                              ],
                            ),
                            // heart Icon
                            const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 25),
                // song duration progress
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Start Time
                          Text("0:00"),

                          // Shuffle Icon
                          Icon(Icons.shuffle),

                          // Repeat Icon
                          Icon(Icons.repeat),

                          // End Time
                          Text("4:30"),
                        ],
                      ),
                    ),

                    // Song Duration Progress
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 0),
                      ),
                      child: Slider(
                          min: 0,
                          max: 100,
                          value: 30,
                          activeColor: Colors.lightBlue.shade400,
                          onChanged: (value) {}),
                    )
                  ],
                ),

                const SizedBox(height: 15),

                // playback controls
                Row(
                  children: [
                    // Skip Previous
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: const NeuBox(
                          child: Icon(Icons.skip_previous),
                        ),
                      ),
                    ),

                    const SizedBox(width: 20),

                    // Play Pause
                    Expanded(
                      flex: 3,
                      child: GestureDetector(
                        onTap: () {},
                        child: const NeuBox(
                          child: Icon(Icons.play_arrow),
                        ),
                      ),
                    ),

                    const SizedBox(width: 20),

                    // Skip Forward
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: const NeuBox(
                          child: Icon(Icons.skip_next),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
