import 'package:flutter/material.dart';

import '../widgets/gridviewcard.dart';
import '../widgets/playing.dart';

class Artists extends StatelessWidget {
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
    {
      " title": "Beyonce",
      "cover": 'assets/images/playlist1.png',
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

  Artists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(5),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0),
              itemCount: splashData.length,
              itemBuilder: (BuildContext context, int index) => GridViewCard(
                context: context,
                title: splashData[index][' title'] ?? '',
                // cover: splashData[index]['cover'] ?? '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
