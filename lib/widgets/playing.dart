import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/services/global_method.dart';
import 'package:musicplayer/services/utils.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlayingCard extends StatefulWidget {
  static const routename = 'PlayingCard';
  final SongModel song;
  final AudioPlayer advancedPlayer;

  const PlayingCard({
    Key? key,
    required this.song,
    required this.advancedPlayer,
  }) : super(key: key);

  @override
  State<PlayingCard> createState() => _PlayingCardState();
}

class _PlayingCardState extends State<PlayingCard> {
  bool isPlaying = false;
  bool isPaused = false;
  bool isSourceSet = false;
  bool isRepeat = false;
  Duration position = Duration.zero;
  Duration duration = Duration.zero;
  @override
  void initState() {
    super.initState();
    // widget.advancedPlayer.play(UrlSource(widget.song.data));

    widget.advancedPlayer.onDurationChanged.listen((d) {
      setState(() {
        duration = d;
      });
    });
    widget.advancedPlayer.onPositionChanged.listen((p) {
      setState(() {
        position = p;
      });
    });

    // widget.advancedPlayer.state

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

  Future<void> setSource(Source source) async {
    setState(() => isSourceSet = false);
    await widget.advancedPlayer.setSource(source);
    setState(() => isSourceSet = true);
  }

  @override
  void dispose() {
    widget.advancedPlayer.dispose();
    widget.advancedPlayer.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final song = widget.song;
    final songDuration = Duration(milliseconds: widget.song.duration!);
    final size = Utils(context).getScreenSize;
    return Scaffold(
      body: Material(
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(GlobalMethods.formatDate(position)),
                  Expanded(
                    child: Slider(
                        min: 0,
                        max: songDuration.inSeconds.toDouble(),
                        value: position.inSeconds.toDouble(),
                        onChanged: (value) async {
                          final newposition = Duration(seconds: value.toInt());
                          await widget.advancedPlayer.seek(newposition);
                          setState(() {
                            position = newposition;
                          });
                        }),
                  ),
                  Text(GlobalMethods.formatDate(songDuration - position)),
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
                    onTap: () async {
                      if (isPlaying) {
                        await widget.advancedPlayer.pause();
                        isPlaying = false;
                      } else {
                        await widget.advancedPlayer.play(UrlSource(song.data));
                        isPlaying = true;
                      }
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
      ),
    );
  }
}
