import 'package:flame_audio/flame_audio.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  factory AudioManager() => _instance;
  AudioManager._internal();

  bool _isMusicEnabled = true;
  bool _isSfxEnabled = true;
  double _musicVolume = 0.7;
  double _sfxVolume = 1.0;

  bool get isMusicEnabled => _isMusicEnabled;
  bool get isSfxEnabled => _isSfxEnabled;
  double get musicVolume => _musicVolume;
  double get sfxVolume => _sfxVolume;

  Future<void> initialize() async {
    try{
      await FlameAudio.audioCache.loadAll([
        'assets/audio/music/baground_music.mp3',
        'assets/audio/sfx/sfx_collect.mp3',
      ]);
      print('Audio initialized succesfully');
    } catch(e) {
      print('Error initializing audio:  $e');
    }
  }

  void playBackgroundMusic() {
    if (_isMusicEnabled) {
      try {
        FlameAudio.bgm.play('assets/audio/music/baground_music.mp3', volume: _musicVolume);
      } catch (e) {
        print('Error playing backround music: $e');
      }
    }
  }
  void stopBackroundMusic() {
    try {
      FlameAudio.bgm.stop();
    } catch (e) {
      print('Error stopping backround music: $e');
    }
  }

  void pauseBackgroundMusic() {
    try {
      FlameAudio.bgm.pause();
    } catch (e) {
      print('Error pausing backround music: $e');
    }
  }

  void resumeBackroundMusic() {
    if (_isMusicEnabled) {
      try {
        FlameAudio.bgm.resume();
      } catch (e) {
        print('Error resuming backround music: $e');
      }
    }
  }

  void playSfx(String fileName) {
    if (_isSfxEnabled) {
      try {
        FlameAudio.play('assets/audio/sfx/sfx_collect.mp3', volume: _sfxVolume);
      } catch (e) {
        print('Error playing sfx: $e');
      }
    }
  }

  void playSfxWithVolume(String fileName, double volume) {
    if (_isSfxEnabled) {
      try {
        final adjustedVolume = (volume * _sfxVolume).clamp(0.0, 1.0);
      } catch (e) {
        print('Error playing SFX with volume: $e');
      }
    }
  }

}