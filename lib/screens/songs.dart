import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/widgets/playing.dart';
import 'package:musicplayer/widgets/songlistcard.dart';

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
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SongModel songModel;
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
                      songModel = item.data![index];
                      if (isPlaying) {
                        PlayingCard(song: song, advancedPlayer: player);
                      }
                      return SongListCard(
                        function: player,
                        song: song,
                        isPlaying: isPlaying,
                        // function: () {
                        //   setState(() {
                        //     isPlaying = !isPlaying;
                        //     log(isPlaying.toString());
                        //     log(song.toString());
                        //     PlayingCard(
                        //       advancedPlayer: player,
                        //       song: song,
                        //     );
                        //   });
                        // },
                      );
                      // return songListCard(
                      //   function: () {
                      //     // if (item.data![index].uri! == songurl &&
                      //     //     isPlaying == false) {
                      //     //   GlobalMethods.playSong(songurl);
                      //     //   setState(() {
                      //     //     isPlaying = true;
                      //     //   });
                      //     // } else if (item.data![index].uri! == songurl) {
                      //     //  widget.
                      //     //   setState(() {
                      //     //     isPlaying = false;
                      //     //   });
                      //     // } else {
                      //     //   setState(() {
                      //     //     isPlaying = true;
                      //     //     songName = item.data![index].title;
                      //     //     songurl = item.data![index].uri!;

                      //     //   });
                      //     //   GlobalMethods.playSong(songurl);
                      //     // }
                      //     // GlobalMethods.songplayingDialog(context: context);
                      //     // final snackBar = SnackBar(
                      //     //   duration: Duration(
                      //     //     seconds: 5,
                      //     //   ),
                      //     //   content: const Text('Hi, I am a SnackBar!'),
                      //     //   backgroundColor: Theme.of(context).cardColor,
                      //     //   // action: SnackBarAction(
                      //     //   //   label: 'dismiss',
                      //     //   //   onPressed: () {},
                      //     //   // ),
                      //     // );
                      //     // ScaffoldMessenger.of(context)
                      //     //     .showSnackBar(snackBar);
                      //     setState(() {
                      //       Visibility(
                      //           visible: true,
                      //           child: PlayingCard(
                      //             song: item.data![index],
                      //             advancedPlayer: player,
                      //           ));
                      //       log('message');
                      //     });

                      //     log(song.toString());
                      //   },
                      //   context: context,
                      //   songname: song.title,
                      //   artistname: song.artist!,
                      //   id: item.data![index].id,
                      // );
                    });
              },
            ),
          ),
          // Visibility(
          //   visible: true,
          //   child: PlayingCard(
          //     song: song,
          //     advancedPlayer: player,
          //   ),
          // ),
        ],
      ),
      // floatingActionButton: PlayingCard(
      //   advancedPlayer: player,
      //   song:songModel,
      // ),
    );
  }

  // songListCard(
  //     {required BuildContext context,
  //     required String songname,
  //     required int id,
  //     required String artistname,
  //     required Function function}) {
  //   final size = Utils(context).getScreenSize;
  //   return InkWell(
  //     onTap: () {
  //       function();
  //     },
  //     child: Material(
  //       color: Theme.of(context).cardColor,
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Row(
  //               children: [
  //                 CircleAvatar(
  //                   child: QueryArtworkWidget(
  //                     id: id,
  //                     type: ArtworkType.AUDIO,
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   width: 10,
  //                 ),
  //                 Container(
  //                   color: Colors.red,
  //                   width: size.width * 0.6,
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         songname,
  //                         maxLines: 1,
  //                         style: const TextStyle(
  //                           overflow: TextOverflow.ellipsis,
  //                           fontWeight: FontWeight.bold,
  //                           fontSize: 18,
  //                         ),
  //                       ),
  //                       Text(
  //                         artistname,
  //                         style: const TextStyle(
  //                           fontWeight: FontWeight.normal,
  //                           fontSize: 12,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Row(
  //               children: [
  //                 InkWell(
  //                   borderRadius: BorderRadius.circular(8),
  //                   onTap: () {},
  //                   child: Icon(
  //                     Icons.favorite,
  //                     size: 36,
  //                     color: Theme.of(context).primaryColor,
  //                   ),
  //                 ),
  //                 InkWell(
  //                   borderRadius: BorderRadius.circular(8),
  //                   onTap: () {},
  //                   child: const Icon(
  //                     Icons.more_vert,
  //                     size: 36,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
