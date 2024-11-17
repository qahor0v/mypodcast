import '../entities/podcast.dart';
import '../repositories/podcast_repository.dart';

class FetchTopPodcasts {
  final PodcastRepository repository;

  FetchTopPodcasts(this.repository);

  Future<List<Podcast>> call() async {
    return await repository.fetchTopPodcasts();
  }
}
