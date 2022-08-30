import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/services/global_method.dart';
import 'package:musicplayer/services/utils.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';

import '../providers/audio_provider.dart';

class PlayingCard extends StatefulWidget {
  final SongModel song;
  final AudioPlayer advancedPlayer;
  final BuildContext context;

  const PlayingCard({
    Key? key,
    required this.song,
    required this.advancedPlayer,
    required this.context,
  }) : super(key: key);

  @override
  State<PlayingCard> createState() => _PlayingCardState();
}

class _PlayingCardState extends State<PlayingCard> {
  bool isPlaying = true;
  bool isPaused = false;
  bool isSourceSet = false;
  bool isRepeat = false;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    // widget.advancedPlayer.onPositionChanged.listen((p) {
    //   setState(() {
    //     position = p;
    //   });
    // });

    widget.advancedPlayer.onPlayerComplete.listen((event) {
      setState(() {
        position = const Duration(seconds: 0);
        if (isRepeat == true) {
          isPlaying = true;
        } else {
          isPlaying = false;
          isRepeat = false;
        }
      });
    });
  }

  // @override
  // void dispose() {
  //   widget.advancedPlayer.dispose();
  //   widget.advancedPlayer.release();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final song = widget.song;
    final songDuration = Duration(milliseconds: song.duration!);

    var playingsong = context.watch<AudioProvider>().myList;
    // var songposition = context.watch<AudioProvider>().getposition;

    return Material(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTitle(
                song: song,
                onTap: () {
                  if (isPlaying) {
                    widget.advancedPlayer.pause();
                    setState(() {
                      isPlaying = false;
                    });
                  } else {
                    widget.advancedPlayer.resume();
                    setState(() {
                      isPlaying = true;
                    });
                  }
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(GlobalMethods.formatDate(position)),
                Expanded(
                  child: Slider(
                      activeColor: Theme.of(context).primaryColor,
                      inactiveColor: Theme.of(context).scaffoldBackgroundColor,
                      min: 0,
                      max: songDuration.inSeconds.toDouble(),
                      value: position.inSeconds.toDouble(),
                      onChanged: (value) async {
                        final newposition = Duration(seconds: value.toInt());
                        await widget.advancedPlayer.seek(newposition);
                        // setState(() {
                        //   position = newposition;
                        // });
                      }),
                ),
                Text(GlobalMethods.formatDate(songDuration - position)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle({required SongModel song, required Function onTap}) {
    final size = Utils(context).getScreenSize;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              child: QueryArtworkWidget(
                id: song.id,
                type: ArtworkType.AUDIO,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              width: size.width * 0.7,
              child: Text(
                song.title,
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
          onTap: () {
            onTap();
          },
          child: Icon(
            isPlaying ? Icons.pause : Icons.play_arrow,
            size: 36,
          ),
        ),
      ],
    );
  }
}
