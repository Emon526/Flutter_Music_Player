import 'package:flutter/material.dart';

import '../widgets/playing.dart';

class PlayList extends StatelessWidget {
  PlayList({Key? key}) : super(key: key);
  final List<Map<String, String>> splashData = [
    {
      " title": "Now Playing",
      "cover": 'assets/images/playlist1.png',
    },
    {
      " title": "Last Added",
      "cover": 'assets/images/playlist2.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: splashData.length,
              itemBuilder: (BuildContext context, int index) => playListCard(
                context: context,
                title: splashData[index][' title'] ?? '',
                // cover: splashData[index]['cover'] ?? '',
              ),
            ),
          ),
          const PlayingCard(songname: 'Believer', artistname: 'imagine Dragon'),
        ],
      ),
    );
  }

  playListCard({required BuildContext context, required String title}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/playlist1.png'),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    alignment: Alignment.centerRight,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_arrow,
                      size: 36,
                    ),
                  ),
                  IconButton(
                    alignment: Alignment.centerRight,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      size: 36,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
