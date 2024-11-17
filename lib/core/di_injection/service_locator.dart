import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:just_audio/just_audio.dart';
import '../../features/book_info/data/datasources/book_info_remote_data_source.dart';
import '../../features/book_info/data/repositories/book_info_repository_impl.dart';
import '../../features/book_info/domain/repositories/book_info_repository.dart';
import '../../features/book_info/domain/use_cases/fetch_vocabulary.dart';
import '../../features/book_info/presentation/bloc/book_info_bloc.dart';
import '../../features/home/data/datasources/podcast_remote_data_source.dart';
import '../../features/home/data/repositories/podcast_repository_impl.dart';
import '../../features/home/domain/repositories/podcast_repository.dart';
import '../../features/home/domain/usecases/fetch_newest_podcasts.dart';
import '../../features/home/domain/usecases/fetch_top_podcasts.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';
import '../../features/podcast_player/presentation/bloc/podcast_player_bloc.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // Registration for third-party services
  locator.registerLazySingleton(() => Dio());
  locator.registerLazySingleton(() => FirebaseFirestore.instance);
  locator.registerLazySingleton(() => AudioPlayer());

  // Registration for data sources
  locator.registerLazySingleton(() => BookInfoRemoteDataSource(locator<Dio>()));
  locator.registerLazySingleton(
      () => PodcastRemoteDataSource(locator<FirebaseFirestore>()));

  // Registration for repositories
  locator.registerLazySingleton<BookInfoRepository>(
    () => BookInfoRepositoryImpl(locator<BookInfoRemoteDataSource>()),
  );
  locator.registerLazySingleton<PodcastRepository>(
    () => PodcastRepositoryImpl(locator<PodcastRemoteDataSource>()),
  );

  // Registration for use cases
  locator.registerLazySingleton(
      () => FetchVocabulary(locator<BookInfoRepository>()));
  locator.registerLazySingleton(
      () => FetchNewestPodcasts(locator<PodcastRepository>()));
  locator.registerLazySingleton(
      () => FetchTopPodcasts(locator<PodcastRepository>()));

  // Registration for blocs
  locator.registerFactory(() => HomeBloc(
        fetchNewestPodcasts: locator<FetchNewestPodcasts>(),
        fetchTopPodcasts: locator<FetchTopPodcasts>(),
      ));
  locator.registerFactory(
      () => BookInfoBloc(fetchVocabulary: locator<FetchVocabulary>()));

  locator.registerFactory(
      () => PodcastPlayerBloc(audioPlayer: locator<AudioPlayer>()));
}
