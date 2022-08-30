import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/audio_provider.dart';
import '../widgets/playing.dart';
import '../widgets/songlistcard.dart';
import '../widgets/sufflecard.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Songs extends StatefulWidget {
  const Songs({Key? key}) : super(key: key);

  @override
  State<Songs> createState() => _SongsState();
}

class _SongsState extends State<Songs> {
  final _audioQuery = OnAudioQuery();
  bool isPlaying = false;
  AudioPlayer player = AudioPlayer();
  @override
  void dispose() {
    player.release();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var playingsong = context.watch<AudioProvider>().myList;
    return Scaffold(
      body: Column(
        children: [
          const ShuffleCard(),
          Expanded(
            child: FutureBuilder<List<SongModel>>(
              future: _audioQuery.querySongs(
                sortType: null,
                orderType: OrderType.ASC_OR_SMALLER,
                uriType: UriType.EXTERNAL,
                ignoreCase: true,
              ),
              builder: (context, item) {
                if (item.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (item.data!.isEmpty) {
                  return const Center(
                    child: Text('No songs found'),
                  );
                }
                return ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 5,
                        ),
                    itemCount: item.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final song = item.data![index];

                      return SongListCard(
                        player: player,
                        song: song,
                        function: () {
                          setState(() {
                            context.read<AudioProvider>().play(
                                  song,
                                  player,
                                );
                          });
                        },
                      );
                    });
              },
            ),
          ),
          playingsong.isNotEmpty
              ? PlayingCard(
                  context: context,
                  advancedPlayer: player,
                  song: playingsong.first,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
