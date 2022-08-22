import 'package:flutter/material.dart';
import 'package:musicplayer/widgets/playing.dart';

import '../widgets/drawer_widget.dart';
import 'albums.dart';
import 'artists.dart';
import 'genres.dart';
import 'playlist.dart';
import 'songs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Music Player',
          ),
          backgroundColor: Theme.of(context).cardColor,
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
              indicatorColor: Theme.of(context).primaryColor,
              labelPadding: const EdgeInsets.only(right: 5, left: 5),
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Theme.of(context).colorScheme.secondary,
              tabs: const [
                Tab(
                  text: "Playlists",
                ),
                Tab(
                  text: "Artists",
                ),
                Tab(
                  text: "Albums",
                ),
                Tab(
                  text: "Songs",
                ),
                Tab(
                  text: "Genres",
                ),
              ]),
        ),
        drawer: const DrawerWidget(),
        body: TabBarView(
          children: [
            PlayList(),
            Artists(),
            Albums(),
            Songs(),
            Genres(),
          ],
        ),
      ),
    );
  }
}
