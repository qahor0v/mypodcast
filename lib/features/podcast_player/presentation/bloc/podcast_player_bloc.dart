import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import '../../../home/domain/entities/podcast.dart';

part 'podcast_player_event.dart';

part 'podcast_player_state.dart';

class PodcastPlayerBloc extends Bloc<PodcastPlayerEvent, PodcastPlayerState> {
  final AudioPlayer audioPlayer;

  PodcastPlayerBloc({required this.audioPlayer})
      : super(PodcastPlayerInitial()) {
    on<LoadPodcastEvent>(_onLoadPodcast);
  }

  Future<void> _onLoadPodcast(
      LoadPodcastEvent event, Emitter<PodcastPlayerState> emit) async {
    emit(PodcastPlayerLoading());
    try {
      await audioPlayer.setUrl(event.podcast.audioLink); // Load audio URL
      emit(PodcastPlayerLoaded(audioPlayer: audioPlayer));
    } catch (e) {
      emit(PodcastPlayerError(
          message: 'Failed to load podcast: ${e.toString()}'));
    }
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
