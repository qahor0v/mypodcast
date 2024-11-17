import '../../domain/entities/podcast.dart';
import '../../domain/repositories/podcast_repository.dart';
import '../datasources/podcast_remote_data_source.dart';

class PodcastRepositoryImpl implements PodcastRepository {
  final PodcastRemoteDataSource remoteDataSource;

  PodcastRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Podcast>> fetchNewestPodcasts() async {
    final podcastModels = await remoteDataSource.getNewestPodcasts();
    return podcastModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<Podcast>> fetchTopPodcasts() async {
    final podcastModels = await remoteDataSource.getTopPodcasts();
    return podcastModels.map((model) => model.toEntity()).toList();
  }
}
