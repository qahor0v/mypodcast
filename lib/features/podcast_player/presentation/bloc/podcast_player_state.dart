part of 'podcast_player_bloc.dart';

abstract class PodcastPlayerState {}

class PodcastPlayerInitial extends PodcastPlayerState {}

class PodcastPlayerLoading extends PodcastPlayerState {}

class PodcastPlayerLoaded extends PodcastPlayerState {
  final AudioPlayer audioPlayer;

  PodcastPlayerLoaded({required this.audioPlayer});
}

class PodcastPlayerError extends PodcastPlayerState {
  final String message;

  PodcastPlayerError({required this.message});
}
