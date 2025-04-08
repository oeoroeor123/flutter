import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class JustAudioWidget extends StatefulWidget {

  const JustAudioWidget({super.key});

  @override
  State<StatefulWidget> createState() => JustAudioState();
}

class JustAudioState extends State<JustAudioWidget> {

  // 상태 변수
  final audioPlayer = AudioPlayer();

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  // 비동기 처리
  void _audioPlay() async {
    await audioPlayer.setAsset("assets/audios/t-rex-roar.mp3"); // 사용하려는 오디오 파일 경로
    audioPlayer.play();
  }

  @override
  Widget build(BuildContext context) {
   return ElevatedButton(
       onPressed: _audioPlay,
       child: const Text("t-rex roar.mp3"),
   );
  }

}