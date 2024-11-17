import '../entities/podcast.dart';
import '../repositories/podcast_repository.dart';

class FetchNewestPodcasts {
  final PodcastRepository repository;

  FetchNewestPodcasts(this.repository);

  Future<List<Podcast>> call() async {
    return await repository.fetchNewestPodcasts();
  }
}
