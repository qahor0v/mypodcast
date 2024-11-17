import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:just_audio/just_audio.dart';
import '../../../../core/di_injection/service_locator.dart';
import '../bloc/podcast_player_bloc.dart';
import '../../../home/domain/entities/podcast.dart';

class PodcastPlayerScreen extends StatelessWidget {
  final Podcast podcast;

  const PodcastPlayerScreen({Key? key, required this.podcast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<PodcastPlayerBloc>()..add(LoadPodcastEvent(podcast)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(podcast.name,style: TextStyle(color: Colors.white70),),
          backgroundColor: const Color(0xff2F2F2F),
          leading: IconButton(
            icon: const Icon(IconlyBroken.arrow_left, color: Color(0xffBFA054)),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocBuilder<PodcastPlayerBloc, PodcastPlayerState>(
          builder: (context, state) {
            if (state is PodcastPlayerLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PodcastPlayerLoaded) {
              return _PodcastPlayerControls(audioPlayer: state.audioPlayer);
            } else if (state is PodcastPlayerError) {
              return Center(
                child: Text(state.message, style: const TextStyle(color: Colors.red)),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class _PodcastPlayerControls extends StatelessWidget {
  final AudioPlayer audioPlayer;

  const _PodcastPlayerControls({Key? key, required this.audioPlayer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<Duration?>(
          stream: audioPlayer.positionStream,
          builder: (context, snapshot) {
            final position = snapshot.data ?? Duration.zero;
            final total = audioPlayer.duration ?? Duration.zero;
            return Column(
              children: [
                Slider(
                  value: position.inSeconds.toDouble(),
                  max: total.inSeconds.toDouble(),
                  onChanged: (value) => audioPlayer.seek(Duration(seconds: value.toInt())),
                ),
                Text(
                  '${_formatDuration(position)} / ${_formatDuration(total)}',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(IconlyBroken.arrow_left_circle, size: 40),
              onPressed: () => audioPlayer.seek(audioPlayer.position - const Duration(seconds: 10)),
            ),
            StreamBuilder<PlayerState>(
              stream: audioPlayer.playerStateStream,
              builder: (context, snapshot) {
                final playerState = snapshot.data;
                final playing = playerState?.playing ?? false;
                if (playing) {
                  return IconButton(
                    icon: const Icon(Icons.pause, size: 50),
                    onPressed: () => audioPlayer.pause(),
                  );
                }
                return IconButton(
                  icon: const Icon(Icons.play_arrow, size: 50),
                  onPressed: () => audioPlayer.play(),
                );
              },
            ),
            IconButton(
              icon: const Icon(IconlyBroken.arrow_right_circle, size: 40),
              onPressed: () => audioPlayer.seek(audioPlayer.position + const Duration(seconds: 10)),
            ),
          ],
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
