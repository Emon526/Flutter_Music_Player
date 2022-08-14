import 'dart:developer';

import 'package:just_audio/just_audio.dart';

class GlobalMethods {
  static final audioPlayer = AudioPlayer();
  static playSong(String? uri) {
    try {
      audioPlayer.setAudioSource(
        AudioSource.uri(
          Uri.parse(uri!),
        ),
      );
      audioPlayer.play();
    } catch (e) {
      log(e.toString());
    }
  }

  static pauseSong() {
    try {
      audioPlayer.pause();
    } catch (e) {
      log(e.toString());
    }
  }

  static String formatDate(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }
}
