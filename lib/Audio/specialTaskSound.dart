import 'dart:math';

import 'package:audioplayers/audioplayers.dart';

class SpecialTaskSound {
  static AudioPlayer? _player;
  late String source;

  //choosing a random sound from the list in assets/Audio/SpecialTaskSounds/valorant_kill_sounds
  void sourceInitialization() {
    List<String> sounds = [
      "Aemondir Kill 5.mp3",
      "Araxys Kill 5.mp3",
      "Base Kill 5.mp3",
      "BlastX Kill 5.mp3",
      "Champions 2021 Kill 5.mp3",
      "Champions 2022 Kill 5.mp3",
      "Champions 2024 Kill 5.mp3",
      "Champions_2023_Kill_5.mp3",
      "ChronoVoid Kill 5.mp3",
      "Cryostasis Kill 5.mp3",
      "Elderflame Kill 5.mp3",
      "Evori Dreamwings Kill 5.mp3",
      "Forsaken Kill 5.mp3",
      "Gaia_s Vengeance Kill 5.mp3",
      "Ion Kill 5.mp3",
      "Kuronami Kill 5.mp3",
      "Magepunk Kill 5.mp3",
      "Mystbloom Kill 5.mp3",
      "Neptune Kill 5.mp3",
      "Oni Kill 5.mp3",
      "Origin Kill 5.mp3",
      "Overdrive Kill 5.mp3",
      "Prelude to Chaos Kill 5.mp3",
      "Prime Kill 5.mp3",
      "Primordium Kill 5.mp3",
      "Protocol 781-A Kill 5.mp3",
      "RGX 11z Pro Kill 5.mp3",
      "Radiant Crisis 001 Kill 5.mp3",
      "Radiant Entertainment System Dance Fever Kill 5.mp3",
      "Radiant Entertainment System K.nock O.ut!! Kill 5.mp3",
      "Radiant Entertainment System Kill 5.mp3",
      "Reaver Kill 5.mp3",
      "Recon Kill 5.mp3",
      "Ruination Kill 5.mp3",
      "Sentinels of Light Kill 5.mp3",
      "Singularity Kill 5.mp3",
      "Sovereign Kill 5.mp3",
      "Spectrum Kill 5.mp3",
      "Spectrum Kill 6.mp3",
      "VCT Team Capsules Kill 5.mp3",
      "Valiant Hero Kill 5.mp3",
      "XERØFANG Kill 5.mp3",
    ];
    source = "Audio/SpecialTask/valorant_kill_sounds/${sounds[Random().nextInt(sounds.length)]}";
  }

  Future<void> loadMusic() async {
    _player = AudioPlayer();
    sourceInitialization();
    await _player?.play(AssetSource(source));
  }

  static void dispose() {
    _player?.dispose();
    _player = null;
  }
}