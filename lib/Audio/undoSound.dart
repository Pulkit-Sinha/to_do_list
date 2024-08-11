import 'package:audioplayers/audioplayers.dart';

class UndoSound {
  static AudioPlayer? _player;

  static Future<void> loadMusic() async {
    _player = AudioPlayer();
    await _player?.play(AssetSource("Audio/undo.wav"));
  }

  static void dispose() {
    _player?.dispose();
    _player = null;
  }
}