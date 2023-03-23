import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayerController extends StatelessWidget {
  final AudioPlayer audioplayer;

  const MusicPlayerController({Key? key, required this.audioplayer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
        stream: audioplayer.playerStateStream,
        builder: (context, snapshot) {
          final playerState = snapshot.data;
          final processingState = playerState?.processingState;
          final playing = playerState?.playing;
          if (!(playing ?? false)) {
            return IconButton(
              onPressed: audioplayer.play,
              iconSize: 70,
              color: Color(0xff2F2F2F),
              icon: Icon(IconlyBold.play),
              //const Icon(Icons.play_arrow_rounded),
            );
          } else if (processingState != ProcessingState.completed) {
            return IconButton(
              onPressed: audioplayer.pause,
              iconSize: 70,
              color:  Color(0xff2F2F2F),
              icon: const Icon(Icons.pause_rounded),
            );
          }
          return const Icon(
            Icons.play_arrow_rounded,
            size: 80,
            color: Colors.black54,
          );
        });
  }
}
