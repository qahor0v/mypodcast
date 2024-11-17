part of 'podcast_player_bloc.dart';

abstract class PodcastPlayerEvent {}

class LoadPodcastEvent extends PodcastPlayerEvent {
  final Podcast podcast;

  LoadPodcastEvent(this.podcast);
}
