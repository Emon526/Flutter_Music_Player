import 'package:flutter/material.dart';

class PlayingCard extends StatelessWidget {
  final String songname;
  final String artistname;

  const PlayingCard(
      {Key? key, required this.songname, required this.artistname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle),
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    backgroundImage: const AssetImage(
                      'assets/images/song-avatar.png',
                    ),
                  ),
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
                    const SizedBox(
                      height: 5,
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
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.play_arrow,
                size: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
