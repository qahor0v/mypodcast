import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/podcast_model.dart';

class AddPodcastController {
  static String? nameController;
  static String? releaseDateController;
  static String? synopsisController;
  static String? detailsController;
  static String? durationController;
  static String? pdfLinkController;
  static String? audioLinkController;
  static String? imageLinkController;

  final CollectionReference _newest_podcasts =
      FirebaseFirestore.instance.collection("newest_podcasts");

  Future<void> create([DocumentSnapshot? documentSnapshot]) async {
    PodcastModel pm = PodcastModel(
      name: nameController,
      releaseDate: releaseDateController,
      synopsis: synopsisController,
      details: detailsController,
      duration: durationController,
      pdfLink: pdfLinkController,
      audioLink: audioLinkController,
      imageLink: imageLinkController,
    );
    await _newest_podcasts.add(pm.toJson());
  }
}
