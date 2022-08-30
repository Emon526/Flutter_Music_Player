import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AudioProvider with ChangeNotifier {
  final List<SongModel> _mysong = [];
  List<SongModel> get myList => _mysong;
  // Duration _duration = Duration.zero;
  // Duration get getduration => _duration;

  // Duration _position = Duration.zero;
  // Duration get getposition => _position;
  void play(SongModel song, AudioPlayer player) {
    _mysong.clear();
    _mysong.add(song);
    player.play(
      UrlSource(song.data),
    );

    // player.onDurationChanged.listen((d) {
    //   _duration = d;
    // });

    // player.onPositionChanged.listen((p) {
    //   _position = p;
    //   // log(p.toString());
    //   log(_position.toString());
    // });

    notifyListeners();
  }
}
