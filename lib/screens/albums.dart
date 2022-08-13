import 'package:flutter/material.dart';

import '../widgets/gridviewcard.dart';
import '../widgets/playing.dart';

class Albums extends StatelessWidget {
  final List<Map<String, String>> splashData = [
    {
      " title": "Adam Levine",
      "cover": 'assets/images/playlist1.png',
    },
    {
      " title": "Alan Walker",
      "cover": 'assets/images/playlist2.png',
    },
    {
      " title": "Beyonce",
      "cover": 'assets/images/playlist1.png',
    },
    {
      " title": "Bruno Mars",
      "cover": 'assets/images/playlist1.png',
    },
  ];

  Albums({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(5.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0),
              itemCount: splashData.length,
              itemBuilder: (BuildContext context, int index) => GridViewCard(
                title: splashData[index][' title'] ?? '',
                context: context,
                // cover: splashData[index]['cover'] ?? '',
              ),
            ),
          ),
          const PlayingCard(
            songname: 'Believer',
            artistname: 'imagine Dragon',
          ),
        ],
      ),
    );
  }
}
