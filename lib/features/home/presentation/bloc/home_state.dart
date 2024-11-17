import 'package:equatable/equatable.dart';
import '../../domain/entities/podcast.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Podcast> newestPodcasts;
  final List<Podcast> topPodcasts;

  HomeLoaded({required this.newestPodcasts, required this.topPodcasts});

  @override
  List<Object> get props => [newestPodcasts, topPodcasts];
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);

  @override
  List<Object> get props => [message];
}
