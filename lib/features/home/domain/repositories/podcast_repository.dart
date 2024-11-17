import '../entities/podcast.dart';

abstract class PodcastRepository {
  Future<List<Podcast>> fetchNewestPodcasts();

  Future<List<Podcast>> fetchTopPodcasts();
}
