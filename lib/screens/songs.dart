import 'package:flutter/material.dart';
import 'package:musicplayer/services/global_method.dart';
import 'package:musicplayer/services/utils.dart';

import '../widgets/playing.dart';
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
  String songName = '';
  String songurl = '';
  Duration duration = Duration.zero;

  @override
  Widget build(BuildContext context) {
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
                  itemBuilder: (BuildContext context, int index) =>
                      songListCard(
                    function: () async {
                      final songDuration =
                          Duration(milliseconds: item.data![index].duration!);

                      if (item.data![index].uri! == songurl &&
                          isPlaying == false) {
                        GlobalMethods.playSong(songurl);
                        setState(() {
                          isPlaying = true;
                        });
                      } else if (item.data![index].uri! == songurl) {
                        GlobalMethods.pauseSong();
                        setState(() {
                          isPlaying = false;
                        });
                      } else {
                        setState(() {
                          isPlaying = true;
                          songName = item.data![index].title;
                          songurl = item.data![index].uri!;
                          duration = songDuration;
                        });
                        GlobalMethods.playSong(songurl);
                      }

                      // log('sdbf jskbd $songDuration');
                      // log(item.data![index].uri.toString());
                      // log(item.data![index].title.toString());
                      // log(item.data![index].artist.toString());
                      // log(item.data![index].duration.toString());
                    },
                    context: context,
                    songname: item.data![index].title,
                    artistname: '${item.data![index].artist}',
                  ),
                );
              },
            ),
          ),
          isPlaying
              ? PlayingCard(
                  songname: songName,
                  url: songurl,
                  duration: duration,
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  songListCard(
      {required BuildContext context,
      required String songname,
      required String artistname,
      required Function function}) {
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
                    child: Image.asset(
                      'assets/images/song-avatar.png',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    color: Colors.red,
                    width: size.width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          songname,
                          maxLines: 1,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          artistname,
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
