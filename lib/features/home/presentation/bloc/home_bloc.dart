import 'package:bloc/bloc.dart';

import '../../domain/usecases/fetch_newest_podcasts.dart';
import '../../domain/usecases/fetch_top_podcasts.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchNewestPodcasts fetchNewestPodcasts;
  final FetchTopPodcasts fetchTopPodcasts;

  HomeBloc({required this.fetchNewestPodcasts, required this.fetchTopPodcasts})
      : super(HomeInitial()) {
    on<FetchPodcasts>(_onFetchPodcasts);
  }

  Future<void> _onFetchPodcasts(
      FetchPodcasts event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final newestPodcasts = await fetchNewestPodcasts();
      final topPodcasts = await fetchTopPodcasts();
      emit(
          HomeLoaded(newestPodcasts: newestPodcasts, topPodcasts: topPodcasts));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
