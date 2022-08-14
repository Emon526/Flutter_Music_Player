import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicplayer/services/global_method.dart';
import 'package:musicplayer/services/utils.dart';

class PlayingCard extends StatefulWidget {
  final String songname;
  final String url;
  final Duration duration;

  const PlayingCard(
      {Key? key,
      required this.songname,
      required this.url,
      required this.duration})
      : super(key: key);

  @override
  State<PlayingCard> createState() => _PlayingCardState();
}

class _PlayingCardState extends State<PlayingCard> {
  bool isPlaying = false;

  Duration position = Duration.zero;

  final _audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;
    return Material(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(GlobalMethods.formatDate(position)),
                Expanded(
                  child: Slider(
                      min: 0,
                      max: widget.duration.inSeconds.toDouble(),
                      value: position.inSeconds.toDouble(),
                      onChanged: (value) async {
                        final newposition = Duration(seconds: value.toInt());
                        await _audioPlayer.seek(newposition);
                        setState(() {
                          position = newposition;
                        });
                      }),
                ),
                Text(GlobalMethods.formatDate(widget.duration - position)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Container(
                    //   padding: const EdgeInsets.all(2),
                    //   decoration: BoxDecoration(
                    //       color: Theme.of(context).primaryColor,
                    //       shape: BoxShape.circle),
                    //   child: CircleAvatar(
                    //     radius: 25.0,
                    //     backgroundColor:
                    //         Theme.of(context).scaffoldBackgroundColor,
                    //     backgroundImage: const AssetImage(
                    //       'assets/images/song-avatar.png',
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   width: 5,
                    // ),
                    Container(
                      width: size.width * 0.8,
                      color: Colors.red,
                      child: Text(
                        widget.songname,
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () async {
                    // if (isPlaying) {
                    //   await _audioPlayer.pause();
                    //   isPlaying = false;
                    // } else {
                    //   await _audioPlayer.play();
                    //   isPlaying = true;
                    // }
                  },
                  child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 36,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
