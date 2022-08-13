import 'package:flutter/material.dart';

import '../widgets/sufflecard.dart';

class Songs extends StatelessWidget {
  Songs({Key? key}) : super(key: key);
  final List<Map<String, String>> splashData = [
    {
      " title": "Now Playing",
      "cover": "Now Playing",
    },
    {
      " title": "Last Added",
      "cover": "Now Playing",
    },
    {
      " title": "Hip Hop",
      "cover": "Now Playing",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ShuffleCard(),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 5,
              ),
              itemCount: splashData.length,
              itemBuilder: (BuildContext context, int index) => songListCard(
                context: context,
                songname: splashData[index][' title'] ?? '',
                artistname: splashData[index]['cover'] ?? '',
              ),
            ),
          ),
          // PlayingCard(songname: 'Believer', artistname: 'imagine Dragon'),
        ],
      ),
    );
  }

  songListCard(
      {required BuildContext context,
      required String songname,
      required String artistname}) {
    return Material(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      songname,
                      style: const TextStyle(
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
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    size: 36,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
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
