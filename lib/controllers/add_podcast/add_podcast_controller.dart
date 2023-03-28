import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/podcast_model.dart';

class AddPodcastController {
  static String? selectedDatabaseTableController;
  static String? nameController;
  static String? releaseDateController;
  static String? synopsisController;
  static String? detailsController;
  static String? durationController;
  static String? pdfLinkController;
  static String? audioLinkController;
  static String? imageLinkController;

  static Future<void> create([DocumentSnapshot? documentSnapshot]) async {
    final CollectionReference databaseTable =
        FirebaseFirestore.instance.collection(selectedDatabaseTableController!);
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
    await databaseTable.add(pm.toJson());
  }
}
