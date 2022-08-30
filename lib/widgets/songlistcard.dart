import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../services/utils.dart';

class SongListCard extends StatelessWidget {
  final Function function;
  final AudioPlayer player;
  final SongModel song;
  const SongListCard({
    Key? key,
    required this.function,
    required this.song,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;
    return InkWell(
      onTap: () {
        function();
      },
      child: Material(
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: QueryArtworkWidget(
                      id: song.id,
                      type: ArtworkType.AUDIO,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: size.width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          song.title,
                          maxLines: 1,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          song.artist!,
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {},
                    child: Icon(
                      Icons.favorite,
                      size: 36,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {},
                    child: const Icon(
                      Icons.more_vert,
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
