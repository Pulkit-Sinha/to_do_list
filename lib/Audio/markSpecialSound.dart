import 'package:audioplayers/audioplayers.dart';

class MarkSpecialSound {
  static AudioPlayer? _player;

  static Future<void> loadMusic() async {
    _player = AudioPlayer();
    await _player?.play(AssetSource("Audio/Ping.mp3"));
  }

  static void dispose() {
    _player?.dispose();
    _player = null;
  }
}