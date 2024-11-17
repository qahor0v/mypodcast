import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/podcast_model.dart';

class PodcastRemoteDataSource {
  final FirebaseFirestore firestore;

  PodcastRemoteDataSource(this.firestore);

  Future<List<PodcastModel>> getNewestPodcasts() async {
    final snapshot = await firestore.collection("newest_podcasts").get();
    return snapshot.docs.map((doc) => PodcastModel.fromFirestore(doc)).toList();
  }

  Future<List<PodcastModel>> getTopPodcasts() async {
    final snapshot = await firestore.collection("newest_podcasts").get();
    return snapshot.docs.map((doc) => PodcastModel.fromFirestore(doc)).toList();
  }
}
